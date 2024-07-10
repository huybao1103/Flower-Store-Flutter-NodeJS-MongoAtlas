import 'package:flower_store/screens/welcome/login.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingScreen extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const SettingScreen(
      {super.key, required this.isDarkMode, required this.onThemeChanged});

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

// // Define your custom dark theme
// final ThemeData customDarkTheme = ThemeData.dark().copyWith(
//   brightness: Brightness.dark,
//   cardColor: const Color(0xff000000),
//   scaffoldBackgroundColor: const Color(0xff2D2C2C),
//   appBarTheme: const AppBarTheme(color: Color(0xffE5386D)),
// );

// // Define your custom light theme
// final ThemeData customLightTheme = ThemeData.light().copyWith(
//   brightness: Brightness.light,
//   cardColor: const Color(0xffFFFFFF),
//   scaffoldBackgroundColor: const Color(0xffF4F4F4),
//   appBarTheme: const AppBarTheme(color: Color(0xffFF85A1)),
// );

class _SettingScreenState extends State<SettingScreen> {
  bool rememberMe = false;
  // final List<String> _icons = [
  //   'assets/vectors/cart_icon.svg',
  //   'assets/vectors/account_icon.svg',
  //   'assets/vectors/setting_icon.svg',
  //   'assets/vectors/home_icon.svg',
  //   'assets/vectors/shop_icon.svg'
  // ];

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final appBarColor =
        isDarkTheme ? const Color(0xffE5386D) : const Color(0xffFF85A1);
    //final selectedColor = isDarkTheme ? Colors.white : Colors.pinkAccent;
    //final unselectedColor = isDarkTheme ? Colors.pinkAccent : Colors.white;
    return Scaffold(
      body: Stack(
        //ở đây dùng stack để chia layer cho app bar và phần content bên trong, tạo hiệu ứng chồng lên nhau
        children: [
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          Container(
            height: 310, // Height of the "AppBar"
            decoration: BoxDecoration(
              color: appBarColor,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(12),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 45, left: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/vectors/setting.svg',
                      //color: Colors.white,
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.only(top: 0, left: 15),
                      child: const Row(
                        children: [
                          Text(
                            'Settings',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 180.0, 16.0,
                  16.0), // chỉnh chiều dài phần padding để chồng lên phần appbar
              child: Card(
                //color: const Color(0xffFFFFFF),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Theme.of(context).cardColor,
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    const ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://i.pinimg.com/originals/5c/e6/ec/5ce6ec7936ed9aa8c2dd89fe540e36a1.jpg'),
                      ),
                      title: Text(
                        'Cường',
                        style: TextStyle(
                            fontFamily: 'Rubik', fontWeight: FontWeight.w400),
                      ),
                    ),
                    const Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top: 10)),
                        Divider(
                          thickness: 0.7,
                          color: Color(0xffCACACA),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 15)),
                        ListTile(
                          title: const Text(
                            'History purchase',
                            style: TextStyle(
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w400),
                          ),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {},
                        ),
                        ListTile(
                          title: const Text(
                            'Change password',
                            style: TextStyle(
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w400),
                          ),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {},
                        ),
                        ListTile(
                          title: const Text(
                            'Add a payment method',
                            style: TextStyle(
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w400),
                          ),
                          trailing: const Icon(Icons.add),
                          onTap: () {},
                        ),
                        SwitchListTile(
                          contentPadding:
                              const EdgeInsets.only(right: 10, left: 15),
                          activeColor: const Color(0xffFF85A1),
                          title: const Text(
                            'Remember me',
                            style: TextStyle(
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w400),
                          ),
                          value: rememberMe,
                          onChanged: (bool value) {
                            setState(() {
                              rememberMe = value;
                            });
                          },
                        ),
                        SwitchListTile(
                          activeColor: const Color(0xffFF85A1),
                          contentPadding:
                              const EdgeInsets.only(right: 10, left: 15),
                          title: const Text(
                            'Dark mode',
                            style: TextStyle(
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w400),
                          ),
                          value: widget.isDarkMode,
                          onChanged: widget.onThemeChanged,
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top: 15)),
                        Divider(
                          thickness: 0.7,
                          color: Color(0xffCACACA),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 15)),
                        const ListTile(
                          title: Text(
                            'More',
                            style: TextStyle(
                                color: Color(0xffADADAD),
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        ListTile(
                          title: const Text(
                            'Log out',
                            style: TextStyle(
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w400),
                          ),
                          trailing: const Icon(Icons.logout),
                          onTap: () {
                            Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen()
                                  ),
                                );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
