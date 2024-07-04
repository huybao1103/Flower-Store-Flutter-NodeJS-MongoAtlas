import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flower_store/screens/setting/setting.screen.dart';
import '../../shared/components/custom.theme.dart';

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({super.key});

  @override
  _MainPageScreenState createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  int _currentIndex = 0;
  bool isDarkMode = false;

  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages = [
      const Center(child: Text('Home', style: TextStyle(fontSize: 24))),
      const Center(child: Text('Shop', style: TextStyle(fontSize: 24))),
      const Center(child: Text('Cart', style: TextStyle(fontSize: 24))),
      const Center(child: Text('Profile', style: TextStyle(fontSize: 24))),
      SettingScreen(
        isDarkMode: isDarkMode,
        onThemeChanged: (bool value) {
          setState(() {
            isDarkMode = value;
          });
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final bottomNavBarTheme = theme.bottomNavigationBarTheme;

    final backgroundColor = bottomNavBarTheme.backgroundColor ??
        (isDarkMode ? const Color(0xffE5386D) : const Color(0xffF3DADF));
    final circleicon = const CircleAvatar().backgroundColor ??
        (isDarkMode
            ? const Color.fromARGB(255, 255, 255, 255)
            : const Color(0xffFF85A1));
    final selectedItemColor = bottomNavBarTheme.selectedItemColor ??
        (isDarkMode
            ? const Color(0xffE5386D)
            : const Color.fromARGB(255, 255, 255, 255));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: customLightTheme,
      darkTheme: customDarkTheme,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        backgroundColor:
            isDarkMode ? const Color(0xff2D2C2C) : const Color(0xffEAEAEA),
        body: _pages[_currentIndex],
        bottomNavigationBar: CurvedNavigationBar(
          index: _currentIndex,
          height: 60.0,
          items: <Widget>[
            CircleAvatar(
              radius: 20,
              backgroundColor: circleicon,
              child: Icon(Icons.home, size: 25, color: selectedItemColor),
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: circleicon,
              child: Icon(Icons.shop, size: 25, color: selectedItemColor),
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: circleicon,
              child:
                  Icon(Icons.shopping_cart, size: 25, color: selectedItemColor),
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: circleicon,
              child: Icon(Icons.person, size: 25, color: selectedItemColor),
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: circleicon,
              child: Icon(Icons.settings, size: 25, color: selectedItemColor),
            ),
          ],
          color: backgroundColor,
          buttonBackgroundColor: circleicon,
          backgroundColor:
              isDarkMode ? const Color(0xff2D2C2C) : const Color(0xffEAEAEA),
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              if (index == 4) {
                _pages[4] = SettingScreen(
                  isDarkMode: isDarkMode,
                  onThemeChanged: (bool value) {
                    setState(() {
                      isDarkMode = value;
                    });
                  },
                );
              }
            });
          },
          letIndexChange: (index) => true,
        ),
      ),
    );
  }
}
