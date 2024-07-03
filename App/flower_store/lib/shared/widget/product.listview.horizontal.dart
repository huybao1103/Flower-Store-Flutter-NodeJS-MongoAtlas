// lib/widgets/product_grid.dart
import 'package:flutter/material.dart';
import '../../models/product.dart';
import 'product_card_favorite.dart';

class ProductListview extends StatelessWidget {
  final List<Product> products;
  final String title;
  Widget? navigator;
  ProductListview({super.key, required this.products, required this.title, this.navigator}) ;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  if(navigator != null) {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => navigator!));
                  }
                },
                child: const Text(
                  'See all',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(8.0),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Container(
                width: 180, 
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                child: ProductCard(product: products[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}

