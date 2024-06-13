import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flower_store/models/base.model.dart';
import 'package:http/http.dart' as http;


class HttpService {
  constructor() {}
  String headerUrl = 'http://192.168.208.68:3000/';

  Future<TType> get<TModel extends IBaseModel, TType>(String path, IBaseModel model) async {
    final response = await http.get(Uri.parse("$headerUrl$path"));

    switch (response.statusCode) {
      case HttpStatus.ok:
        return _jsonBodyParser<TModel>(model, response.body);
      default:
        throw response.body;
    }
  }

  Future<TType> post<TModel extends IBaseModel, TType>(String path, IBaseModel model) async {
    final response = await http.post(Uri.parse("$headerUrl$path"), body: model);

    switch (response.statusCode) {
      case HttpStatus.ok:
        return _jsonBodyParser<TModel>(model, response.body);
      default:
        throw response.body;
    }
  }

  dynamic _jsonBodyParser<TModel>(IBaseModel model, String body) {
    final jsonBody = jsonDecode(body);

    if (jsonBody is List) {
      if(jsonBody.isNotEmpty && jsonBody.first is Map) {
        return jsonBody.map((e) => model.fromJson(e is Map ? e.map((key, value) => MapEntry(key, value)) : e)).toList().cast<TModel>();
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
      return model.fromJson(stringObjectMap);
    } else {
      return jsonBody;
    }
  }
}