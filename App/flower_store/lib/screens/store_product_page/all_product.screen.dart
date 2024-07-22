import 'package:dio/dio.dart';
import 'package:flower_store/constants/colors.dart';
import 'package:flower_store/models/menu.model.dart';
import 'package:flower_store/models/product.dart';
import 'package:flower_store/models/product/product.model.dart';
import 'package:flower_store/screens/user/profile.screen.dart';
import 'package:flower_store/screens/store.main.screen.dart';
import 'package:flower_store/services/product.service.dart';
import 'package:flower_store/shared/components/custom_drawer.dart';
import 'package:flower_store/shared/components/input_decoration.dart';
import 'package:flower_store/shared/components/main_page_header.dart';
import 'package:flower_store/shared/widget/product.grid.dart';
import 'package:flutter/material.dart';
import 'package:flower_store/assets/custom_icon.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({super.key});

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? proName;
  final ProductService _productService = ProductService();
  List<Product> productsFavorite = [];
  List<ProductModel> products = [];
  Dio dio = Dio();
  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    try {
      List<ProductModel> productList = await _productService.getAll();
      setState(() {
        products = productList;
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
        child: Column(
          children: [
            mainPageHeader(_scaffoldKey, context),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0, left: 16, right: 16),
              child: genericFieldContainer(
                  field: FormBuilderTextField(
                      onTapOutside: (event) {
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      onTap: () {},
                      name: proName ?? 'Search',
                      decoration: genericInputDecoration(
                          label: 'Tìm kiếm', prefixIcon: Icons.search))),
            ),
            Expanded(
              child: ProductGridview(
                products: products,
                title: proName ?? 'Tất cả sản phẩm',
              ),
            ),
          ],
        ),
      ),
      drawer: const CustomDrawer(),
    );
  }
}
