import 'package:flower_store/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flower_store/screens/mainpage/mainpage.screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static const TextStyle titleStyle = TextStyle(
    fontFamily: 'Inter',
    color: Color(0xff000000),
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle inputtextStyle = TextStyle(
    fontFamily: 'Inter',
    color: Color(0xff544C4C),
    fontSize: 14,
  );
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  String _selectedCountry = 'Nigeria';
  final List<Map<String, String>> _countries = [
    {'name': 'Nigeria', 'code': 'NG'},
    {'name': 'United States', 'code': 'US'},
    {'name': 'Canada', 'code': 'CA'},
    {'name': 'Australia', 'code': 'AU'},
    // Add more countries as needed
  ];

  @override
  void initState() {
    super.initState();
    // Initialize controllers with default values
    _nameController.text = 'Melissa Peters';
    _emailController.text = 'melpeters@gmail.com';
    _passwordController.text = '*********';
    _dobController.text = '23/05/1995';
    _countryController.text = 'Nigeria';
  }

  @override
  void dispose() {
    // Dispose controllers when the widget is disposed
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _dobController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: MediaQuery.of(context).size.height),
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(color: tdBGColor),
                ),
                SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 5.0),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                // IconButton(
                                SizedBox(
                                  height: 10,
                                ),
                                //   icon: const Icon(Icons.arrow_back,
                                //       size: 34, color: Color(0xff000000)),
                                //   onPressed: () {
                                //     Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //         builder: (context) =>
                                //             const MainPageScreen(
                                //           isBack: true,
                                //         ),
                                //       ),
                                //     );
                                //   },
                                // ),
                                Row(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(left: 130)),
                                    Text(
                                      'Edit Profile',
                                      style: TextStyle(
                                          color: Color(0xff000000),
                                          fontSize: 24,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                            Center(
                              child: Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage(
                                      'https://i.pinimg.com/originals/5c/e6/ec/5ce6ec7936ed9aa8c2dd89fe540e36a1.jpg',
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: CircleAvatar(
                                      backgroundColor: Color(0xff544C4C),
                                      radius: 15,
                                      child: Icon(
                                        Icons.camera_alt,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 16.0),
                                    const Text('Name', style: titleStyle),
                                    const SizedBox(height: 8.0),
                                    TextField(
                                      controller: _nameController,
                                      style:
                                          inputtextStyle, // Change text color here
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                    const Text('Email', style: titleStyle),
                                    const SizedBox(height: 8.0),
                                    TextField(
                                      style: inputtextStyle,
                                      controller: _emailController,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                    const Text(
                                      'Password',
                                      style: titleStyle,
                                    ),
                                    const SizedBox(height: 8.0),
                                    TextField(
                                      style: inputtextStyle,
                                      controller: _passwordController,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                      obscureText: true,
                                    ),
                                    const SizedBox(height: 16.0),
                                    const Text(
                                      'Date of Birth',
                                      style: titleStyle,
                                    ),
                                    const SizedBox(height: 8.0),
                                    GestureDetector(
                                      onTap: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1900),
                                          lastDate: DateTime.now(),
                                        );
                                        if (pickedDate != null) {
                                          setState(() {
                                            _dobController.text =
                                                "${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.year}";
                                          });
                                        }
                                      },
                                      child: AbsorbPointer(
                                        child: TextField(
                                          controller: _dobController,
                                          style:
                                              inputtextStyle, // Change text color here
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                    const Text(
                                      'Country/Region',
                                      style: titleStyle,
                                    ),
                                    const SizedBox(height: 8.0),
                                    DropdownButtonFormField<String>(
                                      style: inputtextStyle,
                                      dropdownColor: const Color(0xffFFFFFF),
                                      value: _selectedCountry,
                                      //border
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                      items: _countries
                                          .map((Map<String, String> country) {
                                        return DropdownMenuItem<String>(
                                          value: country['name'],
                                          child: Text(country['name']!),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          _selectedCountry = newValue!;
                                        });
                                      },
                                    ),
                                    const SizedBox(height: 12.0),
                                    Column(
                                      children: [
                                        //const Padding(padding: EdgeInsets.only(left: 40)),
                                        const Align(
                                          alignment: Alignment.center,
                                        ),
                                        SizedBox(
                                          width: 300,
                                          height: 50,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color(0xff967BB6),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text(
                                              'Save changes',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
