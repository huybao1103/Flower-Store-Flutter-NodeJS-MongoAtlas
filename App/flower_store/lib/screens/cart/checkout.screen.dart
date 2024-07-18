import 'package:flower_store/screens/cart/cart.screen.dart';
import 'package:flower_store/screens/cart/paymentmethod.screen.dart';
import 'package:flower_store/screens/mainpage/mainpage.screen.dart';
import 'package:flutter/material.dart';

Widget? preScreen;

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});
  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final List<Map<String, String>> items = [
    {'name': 'sản phẩm 1', 'price': '100'},
    {'name': 'sản phẩm 2', 'price': '100'},
    {'name': 'sản phẩm 3', 'price': '100'},
  ];

  String addressLine1 = 'Chử đồng tử';
 

  void _editAddress() {
    TextEditingController line1Controller =
        TextEditingController(text: addressLine1);
   
    

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Address'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: line1Controller,
                decoration: const InputDecoration(labelText: 'Address Line 1'),
              ),
            
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  addressLine1 = line1Controller.text;
               
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    int subtotal =
        items.fold(0, (sum, item) => sum + int.parse(item['price']!));
    int delivery = 3;
    int total = subtotal + delivery;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Thanh toán'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MainPageScreen(
                  isBack: true,
                ),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiceChip(
                  label: const Text('Vận chuyển'),
                  selected: true,
                  onSelected: (bool selected) {},
                  selectedColor: Colors.pink[100],
                ),
                SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('Thanh toán'),
                  selected: false,
                  onSelected: (bool selected) {},
                  selectedColor: Colors.grey[300],
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Địa chỉ giao hàng',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  child: Text('Sửa'),
                  onPressed: _editAddress,
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('$addressLine1'),
            ),
            const ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Ngày'),
            ),
            const ListTile(
              leading: Icon(Icons.access_time),
              title: Text('Thời gian'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Chi tiết đơn hàng',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Card(
              color: Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(items[index]['name']!),
                          trailing: Text('\$${items[index]['price']}'),
                        );
                      },
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text('Tổng tiền'),
                      trailing: Text('\$$subtotal'),
                    ),
                    ListTile(
                      title: const Text('Địa chỉ'),
                      trailing: Text('\$$delivery'),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text(
                        'Total',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        '\$$total',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentMethodPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xfff56789),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                ),
                child: const Text(
                  'Xác nhận',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
