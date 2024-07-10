import 'package:flower_store/constants/colors.dart';
import 'package:flower_store/screens/mainpage/mainpage.screen.dart';
import 'package:flower_store/shared/components/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _registerForm = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: gradientBackground),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: MediaQuery.of(context).size.height),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                ),
                Image.asset(
                  'assets/images/logo_shop.png',
                  width: 200,
                ),
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FormBuilder(
                    key: _registerForm,
                    child: Column(children: getRegisterForm())),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getRegisterForm() {
    return [
      genericFieldContainer(
        field: FormBuilderTextField(
            name: 'name',
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
            decoration: genericInputDecoration(
                label: 'Your Name', prefixIcon: Icons.person_2_outlined)),
      ),
      genericFieldContainer(
          field: FormBuilderTextField(
              name: 'email',
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.email(),
              ]),
              decoration: genericInputDecoration(
                  label: 'Email', prefixIcon: Icons.email_outlined))),
      genericFieldContainer(
          field: FormBuilderTextField(
              name: 'phone',
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.maxLength(12),
                FormBuilderValidators.minLength(10),
                FormBuilderValidators.numeric()
              ]),
              decoration: genericInputDecoration(
                  label: 'Phone Number',
                  prefixIcon: Icons.phone_android_outlined))),
      genericFieldContainer(
        field: FormBuilderTextField(
          name: 'password',
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
            FormBuilderValidators.minLength(6)
          ]),
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          decoration: genericInputDecoration(
              label: 'Password', prefixIcon: Icons.password_outlined),
        ),
      ),
      const SizedBox(height: 20),
      MaterialButton(
        color: const Color(0xFFFFEED0),
        minWidth: double.infinity,
        padding: const EdgeInsets.all(15),
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.transparent)),
        elevation: 10,
        focusElevation: 5,
        onPressed: () {
          // Validate and save the form values
          _registerForm.currentState?.saveAndValidate();
          debugPrint(_registerForm.currentState?.value.toString());
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MainPageScreen()),
          );
        },
        child: const Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    ];
  }
}
