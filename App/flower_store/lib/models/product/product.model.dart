import 'dart:ffi';
import 'package:flower_store/models/base.model.dart';

class ProductModel extends IBaseModel<ProductModel> {
  late String nameProduct;
  late double price;
  late String img;
  late int quantity;
  String? descrip;
  List<String>? includeProducts; 
  bool? fav;
  String? cateid;

  ProductModel({
    required this.nameProduct,
    required this.price,
    required this.img,
    required this.quantity,
    this.descrip,
    this.cateid,
    this.includeProducts,
    this.fav,
  });

  ProductModel.empty();

  @override
  ProductModel fromJson(Map<String, Object?> json) {
    return fromJsonMapping(json);
  }

  @override
  ProductModel fromJsonMapping(Map<String, dynamic> json) {
    return ProductModel(
      nameProduct: json['nameProduct'] as String? ?? '',
      price: (json['price'] != null) ? double.parse(json['price'].toString()) : 0.0,
      img: json['img'] as String? ?? '',
      quantity: (json['quantity'] != null) ? int.parse(json['quantity'].toString()) : 0,
      descrip: json['descrip'] as String?,
      cateid: json['cateid'] as String?,
      includeProducts: json['includeProducts'] != null
          ? List<String>.from(json['includeProducts'] as List)
          : [],
      fav: json['fav'] as bool?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nameProduct'] = nameProduct;
    data['price'] = price;
    data['img'] = img;
    data['quantity'] = quantity;
    data['descrip'] = descrip;
    data['includeProducts'] = includeProducts;
    data['fav'] = fav;
    data['cateid'] = cateid;
    return data;
  }
}
