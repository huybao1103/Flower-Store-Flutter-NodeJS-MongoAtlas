import 'package:flower_store/data/api_repository.dart';
import 'package:flower_store/screens/cart/cart.screen.dart';
import 'package:flower_store/screens/cart/paymentmethod.screen.dart';
import 'package:flower_store/screens/mainpage/mainpage.screen.dart';
import 'package:flower_store/services/sqlite.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flower_store/models/cart.dart';

import 'package:flower_store/services/share_pre.dart';

class CheckoutPage extends StatefulWidget {
  final List<Cart> cartItems;

  const CheckoutPage({super.key, required this.cartItems});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  final APIRepository _apiRepository = APIRepository();
  final SharedPreferencesService _sharedPreferencesService =
      SharedPreferencesService();
  String addressLine1 = '';
  final TextEditingController _addressController = TextEditingController();

  void _editAddress() {
    _addressController.text = addressLine1;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Address'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _addressController,
                decoration: const InputDecoration(hintText: 'Nhập địa chỉ'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  addressLine1 = _addressController.text;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  String formatCurrency(double amount) {
    final formatter = NumberFormat.currency(locale: 'vi_VN', symbol: 'VND');
    return formatter.format(amount);
  }

  Future<void> _handleCheckout() async {
    String? accountId = await _sharedPreferencesService.getAccountID();
    if (accountId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account ID not found')),
      );
      return;
    }

    final invoiceData = {
      "details": widget.cartItems.map((item) {
        return {
          "productId": item.productID,
          "quantity": item.quantity,
          "price": item.price,
          "address": _addressController.text ?? _addressController.text,
          "date": DateFormat('dd-MM-yyyy').format(DateTime.now()),
        };
      }).toList(),
      "accountId": accountId,
    };

    bool success = await _apiRepository.addNewInvoice(invoiceData);

    if (success) {
      _databaseHelper.deleteProductAll();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PaymentMethodPage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to create invoice')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    int total = widget.cartItems
        .fold(0, (sum, item) => sum + (item.price * item.quantity).toInt());

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
                        currentScreen: CartPage(),
                      )),
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
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('Thanh toán'),
                  selected: false,
                  onSelected: (bool selected) {},
                  selectedColor: Colors.grey[300],
                ),
              ],
            ),
            const SizedBox(height: 16),
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
                  onPressed: _editAddress,
                  child: const Text('Sửa'),
                ),
              ],
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: Text(
                  addressLine1.isEmpty ? 'Chưa nhập địa chỉ' : addressLine1),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: Text(
                  'Ngày: ${DateFormat('dd/MM/yyyy').format(DateTime.now())}'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Chi tiết đơn hàng',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              color: Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.cartItems.length,
                      itemBuilder: (context, index) {
                        final item = widget.cartItems[index];
                        return ListTile(
                          title: Text('${item.name} (${item.quantity} cái)'),
                          trailing: Text(
                            '${formatCurrency(item.price * item.quantity)}',
                            style: TextStyle(fontSize: 16),
                          ),
                        );
                      },
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text(
                        'Tổng',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        formatCurrency(total.toDouble()),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: _handleCheckout,
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
