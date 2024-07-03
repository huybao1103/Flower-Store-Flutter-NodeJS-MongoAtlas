import 'package:flower_store/screens/cart/addpaymentmethodpage.screen.dart';
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
                child: Image.asset(
                  'assets/images/order_successful.png', // Replace with your image URL
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
              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddPaymentMethodPage(),
                                  ),
                                );
                              },
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
