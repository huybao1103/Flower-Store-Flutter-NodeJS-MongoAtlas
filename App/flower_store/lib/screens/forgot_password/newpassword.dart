import 'package:flower_store/models/authorize/signup.model.dart';
import 'package:flower_store/screens/welcome/login.screen.dart';
import 'package:flower_store/services/authorize.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdatePasswordScreen extends StatefulWidget {
  final AccountModel account;
  const UpdatePasswordScreen({super.key, required this.account});

  @override
  _UpdatePasswordScreenState createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _authorizeService = AuthorizeService();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  late AccountModel account;
  String? error;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    account = widget.account;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: const BoxDecoration(
                        color: Color(0xffECECEC),
                        shape: BoxShape.circle,
                      ),
                      child: Column(
                        children: [
                          const Padding(
                              padding: EdgeInsets.only(top: 13, right: 10)),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SvgPicture.asset(
                              'assets/icons/back_icon.svg',
                              height: 25,
                              width: 25,
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(height: 25),
                  Text(
                    'Đặt lại mật khẩu',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Tạo mật khẩu mới. Đảm bảo nó khác với những cái trước để bảo mật',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: const Color(0xff989898),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 245, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    'Mật khẩu mới',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide:
                              BorderSide(width: 2, color: Color(0xffE1E1E1))),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: const Color(0xffE1E1E1),
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Nhập lại mật khẩu',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    controller: _confirmPasswordController,
                    obscureText: _obscureConfirmPassword,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide:
                              BorderSide(width: 2, color: Color(0xffE1E1E1))),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureConfirmPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: const Color(0xffE1E1E1),
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureConfirmPassword = !_obscureConfirmPassword;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  error != null ? Center(
                    child: Text(
                      error!,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                        
                      ),
                    ),
                  ) : const SizedBox.shrink(),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Color(0xfff56789),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: TextButton(
                        onPressed: () {
                          if(_passwordController.text == '' || _confirmPasswordController.text == '') {
                            setState(() {
                              error = 'Vui lòng nhập đầy đủ thông tin';
                            });
                          }
                          else if(_confirmPasswordController.text != _passwordController.text) {
                            setState(() {
                              error = 'Mật khẩu nhập lại không khớp';
                            });
                          }
                          else {
                            String newPassword = _passwordController.text;
                            account.password = newPassword;
                            _authorizeService.signup(account)
                            .then((value) {
                              setState(() {
                                error = null;
                                Fluttertoast.showToast(
                                  msg: "Đổi mật khẩu thành công",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: const Color.fromARGB(255, 136, 244, 140),
                                  textColor: Colors.black,
                                  fontSize: 16.0
                                );
                              });
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => const LoginScreen()),
                              // );
                            });
                          }
                        },
                        child: Text(
                          'Đặt lại mật khẩu',
                          style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
