import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/invoice.dart';
import '../../data/api_repository.dart';

class HistoryPurchaseScreen extends StatefulWidget {
  const HistoryPurchaseScreen({Key? key}) : super(key: key);

  @override
  _HistoryPurchaseScreenState createState() => _HistoryPurchaseScreenState();
}

class _HistoryPurchaseScreenState extends State<HistoryPurchaseScreen> {
  final APIRepository apiRepository = APIRepository();
  List<Invoice> invoices = [];
  String selectedSortOption = 'Sort By';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchInvoices();
  }

  Future<void> fetchInvoices() async {
    try {
      final fetchedInvoices = await apiRepository.getAllInvoices();
      setState(() {
        invoices = fetchedInvoices;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // Handle error
      print('Failed to load invoices: $e');
    }
  }

  void sortPurchaseHistory(String criteria) {
    setState(() {
      switch (criteria) {
        case 'Sort By':
          invoices.sort((a, b) => a.id.compareTo(b.id));
          break;
        case 'Date':
          // Assuming there's a date field in your Invoice model
          // invoices.sort((a, b) {
          //   DateTime dateA = DateFormat('dd/MM/yyyy').parse(a.date);
          //   DateTime dateB = DateFormat('dd/MM/yyyy').parse(b.date);
          //   return dateA.compareTo(dateB);
          // });
          break;
        case 'Price':
          // Assuming there's a total field in your Invoice model
          //invoices.sort((a, b) => a.total.compareTo(b.total));
          break;
        case 'A-Z':
          invoices.sort((a, b) => a.id.compareTo(b.id));
          break;
        case 'Z-A':
          invoices.sort((a, b) => b.id.compareTo(a.id));
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
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: invoices.length,
                      itemBuilder: (context, index) {
                        final invoice = invoices[index];
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
                                  padding:
                                      const EdgeInsets.only(top: 17, left: 20),
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color.fromARGB(255, 229, 207, 212),
                                        Color.fromARGB(255, 243, 203, 212),
                                        Color(0xffFF85A1),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                    ),
                                  ),
                                  child: Text(
                                    invoice.id,
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
                                    'Account ID',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 4),
                                  child: Text(invoice.accountId),
                                ),
                                const SizedBox(height: 8.0),
                                const Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text(
                                    'Detail Invoice ID',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 4),
                                  child: Text(invoice.detailInvoiceId),
                                ),
                                const SizedBox(height: 16.0),
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
