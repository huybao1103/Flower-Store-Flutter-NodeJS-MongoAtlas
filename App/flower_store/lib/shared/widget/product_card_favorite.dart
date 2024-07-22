// lib/widgets/product_card.dart
import 'package:flower_store/models/product.dart';
import 'package:flower_store/models/product/product.model.dart';
import 'package:flower_store/screens/store_product_page/product_display.screen.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  Widget? navigator;
  ProductCard({super.key, required this.product, this.navigator}) ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  child: Image.network(
                    product.img,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8.0,
                  right: 8.0,
                  child: Icon(
                    product.fav == false ? Icons.favorite : Icons.favorite_border,
                    color: product.fav == true ? Colors.red : Colors.grey,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                
              },
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDisplayScreen(product: product,)));
                  },
                  child: Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    product.nameProduct,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '\$${product.price}',
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
