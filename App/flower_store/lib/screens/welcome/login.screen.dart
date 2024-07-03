import 'package:flower_store/constants/colors.dart';
import 'package:flower_store/screens/store_product_page/all_product.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../shared/components/input_decoration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginForm = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: new GestureDetector(
        onTap: () {
         FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          decoration: const BoxDecoration(
            gradient: gradientBackground,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo_shop.png',
                  width: 200,
                ),
                const Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 28,
                      color: Color.fromARGB(255, 9, 9, 9),
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                FormBuilder(
                      key: _loginForm,
                      child: Column(
                        children: getLoginForm()
                      )
                    ),
                const SizedBox(
                  height: 15,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text(
                    "Need a new account ?",
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Sign up",
                      style: TextStyle(color: Color(0xff920000)),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getLoginForm() {
    return [
      genericFieldContainer(
        field: FormBuilderTextField(
          name: 'email',
          validator: FormBuilderValidators.compose([
            // FormBuilderValidators.required(),
            FormBuilderValidators.email(),
          ]),
          decoration: genericInputDecoration(label: 'Email')
        )
      ),
      genericFieldContainer(
        field: FormBuilderTextField(
          name: 'password',
          validator: FormBuilderValidators.compose([
            // FormBuilderValidators.required(),
          ]),
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          decoration: genericInputDecoration(label: 'Password'),
        ),
      ),
      const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                alignment: Alignment.centerRight,
                child: SizedBox(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot password',
                      style: TextStyle(color: Color(0xff920000)),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ),
      const SizedBox(height: 10),
      MaterialButton(
        color: const Color(0xFFFFEED0),
        minWidth: double.infinity,
        padding: const EdgeInsets.all(15),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.transparent)
        ),
        elevation: 10,
        focusElevation: 5,
        onPressed: () {
          // Validate and save the form values
          _loginForm.currentState?.saveAndValidate();
          debugPrint(_loginForm.currentState?.value.toString());

          Navigator
          .of(context)
          .push(MaterialPageRoute(builder: (context) => const AllProductScreen()));
        },
        child: const Text(
          'Login',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    ];
  }
}

