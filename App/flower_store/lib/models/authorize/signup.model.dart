import 'dart:convert';

import 'package:flower_store/models/base.model.dart';

class AccountModel extends IBaseModel<AccountModel> {
  late String name;
  late String email;
  late String phone;
  late String password;

  AccountModel();
  
  @override
  fromJsonMapping(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
  }

  @override
  AccountModel fromJson(Map<String, Object> json) {
    fromJsonMapping(json);
    return this;
  }
  
  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    return data;
  }
}