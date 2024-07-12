import 'package:flower_store/screens/cart/checkout.screen.dart';
import 'package:flower_store/screens/mainpage/mainpage.screen.dart';
import 'package:flower_store/screens/store.main.screen.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> items = [
    {
      'name': 'Tên sản phẩm',
      'price': 50,
      'quantity': 1,
      'image': 'assets/images/cart_item.jpg'
    },
    {
      'name': 'Tên sản phẩm',
      'price': 50,
      'quantity': 1,
      'image': 'assets/images/cart_item.jpg'
    },
    {
      'name': 'Tên sản phẩm',
      'price': 50,
      'quantity': 1,
      'image': 'assets/images/cart_item.jpg'
    },
    {
      'name': 'Tên sản phẩm',
      'price': 50,
      'quantity': 1,
      'image': 'assets/images/cart_item.jpg'
    },
  ];

  void _incrementQuantity(int index) {
    setState(() {
      items[index]['quantity']++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (items[index]['quantity'] > 1) {
        items[index]['quantity']--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F0F0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 100,
                decoration: const BoxDecoration(
                  color: Color(0xffF0F0F0),
                ),
                child: Row(
                  children: [
                    const Padding(
                        padding: EdgeInsets.only(
                      bottom: 40,
                      left: 5,
                    )),
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MainPageScreen(isBack: true,),
                                  ),
                                );
                      },
                    ),
                    const SizedBox(width: 8.0),
                    const Text(
                      'Giỏ hàng',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                                child: Image.asset(
                                  items[index]['image'],
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.cover, // Điều chỉnh hình ảnh sao cho phù hợp với kích thước
                                ),
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    items[index]['name'],
                                    style: const TextStyle(fontSize: 24.0),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    '\$${items[index]['price'] * items[index]['quantity']}',
                                    style: const TextStyle(fontSize: 16.0),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.remove),
                                        onPressed: () =>
                                            _decrementQuantity(index),
                                      ),
                                      Text(
                                        items[index]['quantity'].toString(),
                                        style: const TextStyle(fontSize: 16.0),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.add),
                                        onPressed: () =>
                                            _incrementQuantity(index),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle save changes button press
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CheckoutPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff967BB6),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  child: const Text('Than toán',
                      style: TextStyle(fontSize: 16, color: Color(0xffF0F0F0))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
