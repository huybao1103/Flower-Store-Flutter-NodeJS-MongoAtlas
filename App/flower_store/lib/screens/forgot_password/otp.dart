import 'package:flower_store/screens/forgot_password/newpassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  _VerifyCodeScreenState createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final _codeController =
      List<TextEditingController>.generate(5, (i) => TextEditingController());

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
                    'Xác thực Email',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Chúng tôi đã gửi mã OTP tới "contact@dscode.com" hãy nhập 5 mã số được gửi vào Email của bạn ',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: const Color(0xff989898),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(5, (index) {
                      return SizedBox(
                        width: 50,
                        child: TextField(
                          controller: _codeController[index],
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          decoration: const InputDecoration(
                            counterText: '',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide(
                                    width: 2, color: Color(0xffE1E1E1))),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 300, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  const SizedBox(height: 32),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Color(0xff648DDB),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const UpdatePasswordScreen()),
                          );
                        },
                        child: Text(
                          'Tạo mật khẩu mới',
                          style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Mã chưa được gửi vào Email? ',
                            style: GoogleFonts.inter(
                                color: const Color(0xff989898),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: 'Gửi lại',
                            style: GoogleFonts.inter(
                              color: const Color(0xff648DDB),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                              decorationColor: const Color(0xff648DDB),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
