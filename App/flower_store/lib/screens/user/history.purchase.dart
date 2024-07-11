import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryPurchaseScreen extends StatefulWidget {
  const HistoryPurchaseScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HistoryPurchaseScreenState createState() => _HistoryPurchaseScreenState();
}

class _HistoryPurchaseScreenState extends State<HistoryPurchaseScreen> {
  List<Map<String, dynamic>> purchaseHistory = [
    {
      'id': 'HD-001',
      'address': 'Address Line 1\nAddress Line 2\nAddress Line 3',
      'date': '01/01/2023',
      'time': '12:00 PM',
      'items': [
        {'name': 'Item1', 'price': 100},
        {'name': 'Item2', 'price': 100},
        {'name': 'Item3', 'price': 100},
        {'name': 'Item5', 'price': 200},
      ],
      'subtotal': 500,
      'delivery': 3,
      'total': 503,
    },
    {
      'id': 'HD-002',
      'address': 'Address Line 1\nAddress Line 2\nAddress Line 3',
      'date': '02/01/2023',
      'time': '01:00 PM',
      'items': [
        {'name': 'Item1', 'price': 100},
        {'name': 'Item2', 'price': 150},
        {'name': 'Item3', 'price': 100},
        {'name': 'Item4', 'price': 100},
      ],
      'subtotal': 450,
      'delivery': 3,
      'total': 453,
    },
    {
      'id': 'HD-003',
      'address': 'Address Line 1\nAddress Line 2\nAddress Line 3',
      'date': '03/01/2023',
      'time': '02:00 PM',
      'items': [
        {'name': 'Item1', 'price': 300},
        {'name': 'Item2', 'price': 100},
        {'name': 'Item3', 'price': 100},
        {'name': 'Item4', 'price': 100},
      ],
      'subtotal': 600,
      'delivery': 3,
      'total': 603,
    },
    {
      'id': 'HD-004',
      'address': 'Address Line 1\nAddress Line 2\nAddress Line 3',
      'date': '04/01/2023',
      'time': '03:00 PM',
      'items': [
        {'name': 'Item1', 'price': 100},
        {'name': 'Item2', 'price': 100},
        {'name': 'Item3', 'price': 700},
        {'name': 'Item4', 'price': 100},
      ],
      'subtotal': 1000,
      'delivery': 3,
      'total': 1003,
    },
  ];
  String selectedSortOption = 'Sort By';

  void sortPurchaseHistory(String criteria) {
    setState(() {
      switch (criteria) {
        case 'Sort By':
          purchaseHistory.sort((a, b) => a['id'].compareTo(b['id']));
          break;
        case 'Date':
          purchaseHistory.sort((a, b) {
            DateTime dateA = DateFormat('dd/MM/yyyy').parse(a['date']);
            DateTime dateB = DateFormat('dd/MM/yyyy').parse(b['date']);
            return dateA.compareTo(dateB);
          });
          break;
        case 'Price':
          purchaseHistory.sort((a, b) => a['total'].compareTo(b['total']));
          break;
        case 'A-Z':
          purchaseHistory.sort((a, b) => a['id'].compareTo(b['id']));
          break;
        case 'Z-A':
          purchaseHistory.sort((a, b) => b['id'].compareTo(a['id']));
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F0F0),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Container(
            width: double.infinity,
            height: 60,
            decoration: const BoxDecoration(
              color: Color(0xffF0F0F0),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 8.0),
                const Text(
                  'History Purchase',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              const SizedBox(width: 20),
              DropdownButtonHideUnderline(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffFA6C6C),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: DropdownButton<String>(
                    value: selectedSortOption,
                    dropdownColor: const Color(0xffFA6C6C),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedSortOption = newValue;
                          sortPurchaseHistory(selectedSortOption);
                        });
                      }
                    },
                    items: <String>[
                      'Sort By',
                      'Date',
                      'Price',
                      'A-Z',
                      'Z-A',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            value,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: purchaseHistory.length,
                itemBuilder: (context, index) {
                  final purchase = purchaseHistory[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 60,
                            padding: const EdgeInsets.only(top: 17, left: 20),
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color.fromARGB(255, 229, 207, 212),
                                  Color.fromARGB(255, 243, 203, 212),
                                  Color(0xffFF85A1)
                                ],
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                              ),
                            ),
                            child: Text(
                              purchase['id'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.pinkAccent,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'Delivery Address',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 4),
                            child: Text(purchase['address']),
                          ),
                          const SizedBox(height: 8.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 4),
                            child: Row(
                              children: [
                                const Icon(Icons.calendar_today, size: 16),
                                const SizedBox(width: 4.0),
                                Text(purchase['date']),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 4),
                            child: Row(
                              children: [
                                const Icon(Icons.access_time, size: 16),
                                const SizedBox(width: 4.0),
                                Text(purchase['time']),
                              ],
                            ),
                          ),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: purchase['items'].length,
                              itemBuilder: (context, itemIndex) {
                                final item = purchase['items'][itemIndex];
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(item['name']),
                                      Text('\$${item['price']}'),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Subtotal'),
                                    Text('\$${purchase['subtotal']}'),
                                  ],
                                ),
                                const SizedBox(height: 4.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Delivery'),
                                    Text('\$${purchase['delivery']}'),
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Total',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '\$${purchase['total']}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16.0),
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
          ),
        ],
      ),
    );
  }
}
