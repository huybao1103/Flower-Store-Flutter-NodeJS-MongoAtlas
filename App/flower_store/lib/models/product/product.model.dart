import 'dart:ffi';

import 'package:flower_store/models/base.model.dart';

class ProductModel extends IBaseModel<ProductModel> {
  late String nameProduct;
  late double price;
  late String img;
  late int quantity;
  String? descrip;
  late List<ProductModel>? includeProducts;
  bool? fav;
  late String? cateid = '';
  
  ProductModel({
    required this.nameProduct,
    required this.price,
    required this.img,
    required this.quantity,
    this.descrip,
  });

  get inclueId => null;

  @override
  fromJson(Map<String, Object> json) => fromJsonMapping(json);

  @override
  fromJsonMapping(Map<String, dynamic> json) {
    nameProduct = json['nameProduct'];
    price = double.parse(json['price'].toString());
    img = json['img'];
    quantity = int.parse(json['quantity'].toString());
    descrip = json['descrip'];
    var inclueId = json['inclueId'] != null ? List<String>.from(json['inclueId']) : null;
    fav = json['fav'];
    cateid = json['cateid'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nameProduct'] = nameProduct;
    data['price'] = price;
    data['img'] = img;
    data['quantity'] = quantity;
    data['descrip'] = descrip;
    data['inclueId'] = inclueId;
    data['fav'] = fav;
    data['cateid'] = cateid;
    return data;
  }
}
