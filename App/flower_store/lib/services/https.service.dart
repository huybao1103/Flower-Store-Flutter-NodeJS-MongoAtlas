import 'dart:convert';
import 'dart:io';
import 'package:flower_store/models/base.model.dart';
import 'package:http/http.dart' as http;


class HttpService {
  constructor() {}
  // String headerUrl = 'http://10.0.2.2:3000/'; // Emulator
  String headerUrl = 'http://192.168.1.85:3000/api/'; // Physic device

  Future<TResultType> get<TModel extends IBaseModel, TResultType>(String path, IBaseModel model) async {
    final response = await http.get(Uri.parse("$headerUrl$path"));

    switch (response.statusCode) {
      case HttpStatus.ok:
        return _jsonBodyParser<TModel>(model, response.body);
      default:
        throw response.body;
    }
  }

  Future<TResultType> post<TModel extends IBaseModel, TResultType>(String path, IBaseModel model, { IBaseModel? returnType }) async {
    final response = await http.post(Uri.parse("$headerUrl$path"), body: model.toJson());

    switch (response.statusCode) {
      case HttpStatus.ok:
        return _jsonBodyParser<TResultType>(model, response.body, returnType: returnType);
      default:
        throw response.body;
    }
  }

  dynamic _jsonBodyParser<TResultType>(IBaseModel model, String body, { IBaseModel? returnType }) {
    final jsonBody = jsonDecode(body);
    if (jsonBody is List) {
      if(jsonBody.isNotEmpty && jsonBody.first is Map) {
        return jsonBody.map((e) => returnType != null 
          ? returnType.fromJson(e is Map ? e.map((key, value) => MapEntry(key, value)) : e)
          : model.fromJson(e is Map ? e.map((key, value) => MapEntry(key, value)) : e)
        ).toList().cast<TResultType>();
      }
    } else if (jsonBody is Map) {
      Map<String, Object> stringObjectMap = jsonBody.map(
        (key, value) {
          if (key is! String) {
            throw ArgumentError('All keys must be of type String');
          }
          if (value is! Object) {
            throw ArgumentError('All values must be of type Object');
          }
          return MapEntry(key, value);
        },
      );
      return returnType != null
        ? returnType.fromJson(stringObjectMap)
        : model.fromJson(stringObjectMap);
    } else {
      return jsonBody;
    }
  }

  // Future post(String path, IBaseModel model, ) async {
  //   final response = await http.post(Uri.parse("$headerUrl$path"), body: model.toJson());

  //   switch (response.statusCode) {
  //     case HttpStatus.ok:
  //       return jsonDecode(response.body);
  //     default:
  //       throw response.body;
  //   }
  // }
}