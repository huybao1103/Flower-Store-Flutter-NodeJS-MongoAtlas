import 'package:flower_store/screens/forgot_password/forgot.password.dart';
import 'package:flower_store/screens/user/history.purchase.dart';
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

class _SettingScreenState extends State<SettingScreen> {
  bool rememberMe = false;
  late bool isDarkMode;

  @override
  void initState() {
    super.initState();
    isDarkMode = widget.isDarkMode;
  }

  @override
  Widget build(BuildContext context) {
    final appBarColor =
        isDarkMode ? const Color(0xffE5386D) : const Color(0xffFF85A1);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          Container(
            height: 310,
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
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.only(top: 0, left: 15),
                      child: const Row(
                        children: [
                          Text(
                            'Cài đặt',
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
              padding: const EdgeInsets.fromLTRB(16.0, 180.0, 16.0, 16.0),
              child: Card(
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
                            'Lịch sử mua hàng',
                            style: TextStyle(
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w400),
                          ),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HistoryPurchaseScreen()));
                          },
                        ),
                        ListTile(
                          title: const Text(
                            'Đổi mật khẩu',
                            style: TextStyle(
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w400),
                          ),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()));
                          },
                        ),
                        ListTile(
                          title: const Text(
                            'Thêm phương thức thanh toán',
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
                            'Lưu đăng nhập',
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
                          value: isDarkMode,
                          onChanged: (bool value) {
                            setState(() {
                              isDarkMode = value;
                            });
                            widget.onThemeChanged(value);
                          },
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
                            'Thêm...',
                            style: TextStyle(
                                color: Color(0xffADADAD),
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        ListTile(
                          title: const Text(
                            'Đăng xuất',
                            style: TextStyle(
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w400),
                          ),
                          trailing: const Icon(Icons.logout),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
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
