import 'package:flower_store/constants/colors.dart';
import 'package:flower_store/shared/components/input_decoration.dart';
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
  final List<Product> productsFavorite = [
    Product(
      name: 'Blushing Bride',
      price: 56,
      imageUrl:
          'https://product.hstatic.net/200000846175/product/z5544206552217_68cd21965416a9e4e15d838797fafb68-min_047147ebaacc456095f669d928b2052b_1024x1024.jpg',
      isFavorite: true,
    ),
    Product(
      name: 'Herves Love',
      price: 56,
      imageUrl:
          'https://product.hstatic.net/200000846175/product/_052e215d0bf4937c855e88d6d4b3e092-min_4ee2c7cf7ae24d67b1b46156d8b96f8c_bd89a4bf469c4db7833f9c3a51f8252e_1024x1024.jpg',
      isFavorite: true,
    ),
    Product(
      name: 'Rose Bouquet',
      price: 56,
      imageUrl:
          'https://product.hstatic.net/200000846175/product/4-min_d37e9a752bc145a4b6c407f01666a7d4_f60c9f31b2f947f285846b25733d2dc4_1024x1024.jpg',
      isFavorite: true,
    ),
    Product(
      name: 'Blushing Bride',
      price: 56,
      imageUrl:
          'https://product.hstatic.net/200000846175/product/z5544206552217_68cd21965416a9e4e15d838797fafb68-min_047147ebaacc456095f669d928b2052b_1024x1024.jpg',
      isFavorite: true,
    ),
    Product(
      name: 'Herves Love',
      price: 56,
      imageUrl:
          'https://product.hstatic.net/200000846175/product/_052e215d0bf4937c855e88d6d4b3e092-min_4ee2c7cf7ae24d67b1b46156d8b96f8c_bd89a4bf469c4db7833f9c3a51f8252e_1024x1024.jpg',
      isFavorite: true,
    ),
    Product(
      name: 'Rose Bouquet',
      price: 56,
      imageUrl:
          'https://product.hstatic.net/200000846175/product/4-min_d37e9a752bc145a4b6c407f01666a7d4_f60c9f31b2f947f285846b25733d2dc4_1024x1024.jpg',
      isFavorite: true,
    ),
    Product(
      name: 'Blushing Bride',
      price: 56,
      imageUrl:
          'https://product.hstatic.net/200000846175/product/z5544206552217_68cd21965416a9e4e15d838797fafb68-min_047147ebaacc456095f669d928b2052b_1024x1024.jpg',
      isFavorite: true,
    ),
    Product(
      name: 'Herves Love',
      price: 56,
      imageUrl:
          'https://product.hstatic.net/200000846175/product/_052e215d0bf4937c855e88d6d4b3e092-min_4ee2c7cf7ae24d67b1b46156d8b96f8c_bd89a4bf469c4db7833f9c3a51f8252e_1024x1024.jpg',
      isFavorite: true,
    ),
    Product(
      name: 'Rose Bouquet',
      price: 56,
      imageUrl:
          'https://product.hstatic.net/200000846175/product/4-min_d37e9a752bc145a4b6c407f01666a7d4_f60c9f31b2f947f285846b25733d2dc4_1024x1024.jpg',
      isFavorite: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: gradientBackground,
          ),
          child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                  child: genericFieldContainer(
                      field: FormBuilderTextField(
                        onTapOutside: (event) {
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        onTap: (){
                        },
                          name: 'Search',
                          decoration: genericInputDecoration(label: 'Search', prefixIcon: Icons.search))),
                ),
                Expanded(
                  child: ProductGridview(
                    products: productsFavorite,
                    title: 'Your favorite',
                  ),
                ),
              ]))),
    );
  }
}
