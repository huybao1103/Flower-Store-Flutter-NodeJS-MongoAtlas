import 'package:flutter/material.dart';



class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final List<Map<String, String>> items = [
    {'name': 'Item 1', 'price': '100'},
    {'name': 'Item 2', 'price': '100'},
    {'name': 'Item 3', 'price': '100'},
  ];

  String addressLine1 = 'Address Line 1';
  String addressLine2 = 'Address Line 2';
  String addressLine3 = 'Address Line 3';

  void _editAddress() {
    TextEditingController line1Controller = TextEditingController(text: addressLine1);
    TextEditingController line2Controller = TextEditingController(text: addressLine2);
    TextEditingController line3Controller = TextEditingController(text: addressLine3);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Address'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: line1Controller,
                decoration: InputDecoration(labelText: 'Address Line 1'),
              ),
              TextField(
                controller: line2Controller,
                decoration: InputDecoration(labelText: 'Address Line 2'),
              ),
              TextField(
                controller: line3Controller,
                decoration: InputDecoration(labelText: 'Address Line 3'),
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
                  addressLine2 = line2Controller.text;
                  addressLine3 = line3Controller.text;
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
    int subtotal = items.fold(0, (sum, item) => sum + int.parse(item['price']!));
    int delivery = 3;
    int total = subtotal + delivery;

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
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
                  label: Text('Delivery'),
                  selected: true,
                  onSelected: (bool selected) {},
                  selectedColor: Colors.pink[100],
                ),
                SizedBox(width: 8),
                ChoiceChip(
                  label: Text('Payment'),
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
                Text(
                  'Delivery Address',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  child: Text('Edit'),
                  onPressed: _editAddress,
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('$addressLine1\n$addressLine2\n$addressLine3'),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Date'),
            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text('Time'),
            ),
            SizedBox(height: 16),
            Text(
              'Order Summary',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Card(
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
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(items[index]['name']!),
                          trailing: Text('\$${items[index]['price']}'),
                        );
                      },
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Subtotal'),
                      trailing: Text('\$$subtotal'),
                    ),
                    ListTile(
                      title: Text('Delivery'),
                      trailing: Text('\$$delivery'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text(
                        'Total',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        '\$$total',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                ),
                child: Text(
                  'Confirm',
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
