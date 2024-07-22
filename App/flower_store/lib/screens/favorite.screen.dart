import 'package:flower_store/assets/custom_icon.dart';
import 'package:flower_store/constants/colors.dart';
import 'package:flower_store/models/menu.model.dart';
import 'package:flower_store/models/product/product.model.dart';
import 'package:flower_store/screens/user/profile.screen.dart';
import 'package:flower_store/screens/store.main.screen.dart';
import 'package:flower_store/services/product.service.dart';
import 'package:flower_store/shared/components/custom_drawer.dart';
import 'package:flower_store/shared/components/input_decoration.dart';
import 'package:flower_store/shared/components/main_page_header.dart';
import 'package:flower_store/shared/widget/product.grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../models/product.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<ProductModel> productsFavorite = [];
  final ProductService _productService = ProductService();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> category = [
    " Bridal bouquet",
    " Bouquet",
    " Vase of flowers",
    "Basker of flowers",
    "Box of flowers",
    "Congratulation flowers",
    "Condolence flowers",
    "Tet flower collection",
  ];

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    try {
      List<ProductModel> productList = await _productService.getProductFavorite();
      setState(() {
        productsFavorite = productList;
      });
    } catch (e) {
      print('Lỗi khi tải sản phẩm: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
          decoration: const BoxDecoration(
            gradient: gradientBackground,
          ),
          child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(children: [
                mainPageHeader(_scaffoldKey, context),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                  child: genericFieldContainer(
                      field: FormBuilderTextField(
                          onTapOutside: (event) {
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                          onTap: () {},
                          name: 'Search',
                          decoration: genericInputDecoration(
                              label: 'Tìm kiếm', prefixIcon: Icons.search))),
                ),
                Expanded(
                  child: ProductGridview(
                    products: productsFavorite,
                    title: 'Đã thích',
                  ),
                ),
              ]))),
      drawer: const CustomDrawer(),
    );
  }
}
