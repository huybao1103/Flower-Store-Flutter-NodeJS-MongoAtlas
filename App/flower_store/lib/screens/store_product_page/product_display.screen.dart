import 'package:flower_store/constants/colors.dart';
import 'package:flower_store/models/product.dart';
import 'package:flower_store/screens/cart/cart.screen.dart';
import 'package:flower_store/shared/widget/product.listview.horizontal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDisplayScreen extends StatefulWidget {
  final Product product;
  const ProductDisplayScreen({super.key, required this.product});

  @override
  State<ProductDisplayScreen> createState() => _ProductDisplayScreenState();
}

class _ProductDisplayScreenState extends State<ProductDisplayScreen> {
  final GlobalKey _key = GlobalKey();

  final ScrollController _scrollController = ScrollController();
  bool _isPriceCardFixed = false;

  late bool liked = false;
  late Product product;
  late double originalPrice;
  int quantity = 1;
  double screenHeight = 1000;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    product = widget.product;
    liked = widget.product.isFavorite;
    originalPrice = product.price;

    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    final RenderBox renderBox =
        _key.currentContext?.findRenderObject() as RenderBox;

    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final double startY = offset.dy;

    setState(() {
      _isPriceCardFixed = startY <= (screenHeight * 30 /100);
    });
    debugPrint(_isPriceCardFixed.toString());
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    debugPrint((screenHeight * 35 /100).toString());
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(color: Color(0xFFF0F0F0)),
            child: SingleChildScrollView(
              controller: _scrollController,
              padding: EdgeInsets.only(top: screenHeight * 35/100 + (_isPriceCardFixed ? screenHeight * 5/100 : 0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(product.name,
                                style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                          ],
                        ),
                        if (!_isPriceCardFixed) priceCard(),
                        if (product.description != null) description(),
                        ProductListview(
                          products: product.includeProducts,
                          title: 'Sản phẩm bao gồm',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const CartPage(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xfff56789),
                                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                              ),
                              child: const  Text(
                                'Thêm vào giỏ hàng',
                                style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: header(),
          ),
          if (_isPriceCardFixed)
            Positioned(
              top: screenHeight * 35 /100, // Position it just below the header
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: priceCard(),
              ),
            ),
        ],
      ),
    );
  }

  Container header() {
    return Container(
      width: double.infinity,
      height: screenHeight * 35 / 100,
      decoration: const BoxDecoration(
          color: softPink,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))),
      child: Padding(
        padding: EdgeInsets.only(
            left: 16, right: 16, top: screenHeight * 5 / 100, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: product.imageUrl.contains('https://')
                  ? Image.network(
                      product.imageUrl,
                      // width: MediaQuery.of(context).size.width * 60/100,
                    )
                  : Image.asset(
                      product.imageUrl,
                      // width: MediaQuery.of(context).size.width * 60/100,
                    ),
            ),
            IconButton(
              icon: Icon(liked ? Icons.favorite : Icons.favorite_border,
                  color: iconColor),
              onPressed: () => setState(() => liked = !liked),
            ),
          ],
        ),
      ),
    );
  }

  Card priceCard() {
    return Card(
      key: _key,
      margin: _isPriceCardFixed 
        ? EdgeInsets.zero 
        : const EdgeInsets.only(bottom: 10, top: 10),
      elevation: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('  \$${product.price}', style: const TextStyle(fontSize: 20, color: Colors.red)),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () => setState(() {
                  if (quantity > 1) {
                    quantity--;
                  }
                  product.price = originalPrice * quantity;
                }),
              ),
              Text(
                quantity.toString(),
                style: const TextStyle(fontSize: 16.0, color: Colors.red),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => setState(() {
                  if (quantity < product.stock) {
                    quantity++;
                  }
                  product.price = originalPrice * quantity;
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget description() {
    return
      Padding(
        padding: const EdgeInsets.only(
            top: 10.0, bottom: 10),
        child: SizedBox(
          height: screenHeight * 15 / 100,
          child: SingleChildScrollView(
            child: Text('${product.description}',
                style: const TextStyle(fontSize: 17)),
          ),
        ),
      );
  }
}
