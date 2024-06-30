import 'package:flutter/material.dart';



class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> items = [
    {
      'name': 'Item Name',
      'price': 50,
      'quantity': 1,
      'image': 'https://via.placeholder.com/150'
    },
    {
      'name': 'Item Name',
      'price': 50,
      'quantity': 1,
      'image': 'https://via.placeholder.com/150'
    },
    {
      'name': 'Item Name',
      'price': 50,
      'quantity': 1,
      'image': 'https://via.placeholder.com/150'
    },
    {
      'name': 'adasdasdas',
      'price': 50,
      'quantity': 1,
      'image': 'https://via.placeholder.com/150'
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
      backgroundColor: Color(0xffF0F0F0),
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
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 8.0),
                  const Text(
                    'Shopping cart',
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
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.network(
                              items[index]['image'],
                              width: 100,
                              height: 100,
                            ),
                            SizedBox(width: 16.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    items[index]['name'],
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    '\$${items[index]['price']}',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                  SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.remove),
                                        onPressed: () => _decrementQuantity(index),
                                      ),
                                      Text(
                                        items[index]['quantity'].toString(),
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.add),
                                        onPressed: () => _incrementQuantity(index),
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
             Container(
              width: double.infinity,
               child: 
                 ElevatedButton(
                              onPressed: () {
                                // Handle save changes button press
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff967BB6),
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                              ),
                              child: const Text('Save changes', style: TextStyle(fontSize: 16,color: Color(0xffF0F0F0))),
                            ),        
             ),
            ],
          ),
        ),
      ),
      
    );
  }
}
