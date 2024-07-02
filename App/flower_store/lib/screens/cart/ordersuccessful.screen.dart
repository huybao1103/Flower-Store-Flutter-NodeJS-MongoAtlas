import 'package:flutter/material.dart';



class OrderSuccessfulPage extends StatefulWidget {
  @override
  _OrderSuccessfulPageState createState() => _OrderSuccessfulPageState();
}

class _OrderSuccessfulPageState extends State<OrderSuccessfulPage> {
  void _continueShopping() {
    // Implement the continue shopping functionality here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Image.network(
                  'https://cdn.discordapp.com/attachments/1190508294448631948/1257714297447124992/image.png?ex=66856937&is=668417b7&hm=954ecc32ffed9ac9b6edb80137db0e4ac10f3709f6bd9df6e157d53be1cc7c2d&', // Replace with your image URL
                  height: 400,
                ),
              ),
            ),
            Text(
              'Order Successfully Placed',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              'Your Order Has Been Successfully Placed\nAnd Has Been Processed For Delivery',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: _continueShopping,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Continue Shopping',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
