import 'package:dio/dio.dart';
import 'package:flower_store/models/authorize/signup.model.dart';
import '../models/invoice.dart';

class APIRepository {
  final Dio _dio = Dio();
  String baseUrl = "http://192.168.1.2:3000";

  APIRepository() {
    _dio.options.baseUrl = "$baseUrl/api";
  }

  Future<List<Invoice>> getAllInvoices() async {
    try {
      Response response = await _dio.get(
        '/Invoice/getall-invoice',
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((invoice) => Invoice.fromJson(invoice))
            .toList();
      } else {
        throw Exception('Failed to load invoices');
      }
    } catch (e) {
      throw Exception('Failed to load invoices: $e');
    }
  }

  Future<bool> updateProfile(AccountModel account) async {
    try {
      Response response = await _dio.post(
        '/Accounts/signup-update',
        data: account.toJson(),
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Failed to update profile: $e');
      return false;
    }
  }
}
