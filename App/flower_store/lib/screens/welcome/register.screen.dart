import 'package:flower_store/constants/colors.dart';
import 'package:flower_store/shared/components/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({ Key? key }) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _registerForm = GlobalKey<FormBuilderState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: gradientBackground
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 100),
            ),
            const SizedBox(
              width: double.infinity,
              child: Text(
                'Đăng Ký',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            FormBuilder(
                key: _registerForm,
                child: Column(
                  children: getRegisterForm()
                )),
          ],
        ),
        )
      ),
    );
  }

  List<Widget> getRegisterForm() {
    return [
      FormBuilderTextField(
        name: 'email',
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
        ]),
        decoration: genericInputDecoration(label: 'Your Name')
      ),
      const SizedBox(height: 20),
      FormBuilderTextField(
        name: 'email',
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.email(),
        ]),
        decoration: genericInputDecoration(label: 'Email')
      ),
      const SizedBox(height: 20),
      FormBuilderTextField(
        name: 'password',
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
        ]),
        decoration: genericInputDecoration(label: 'Password')
      ),
      MaterialButton(
        color: Theme.of(context).colorScheme.secondary,
        onPressed: () {
          // Validate and save the form values
          _registerForm.currentState?.saveAndValidate();
          debugPrint(_registerForm.currentState?.value.toString());

          // On another side, can access all field values without saving form with instantValues
          _registerForm.currentState?.validate();
          debugPrint(_registerForm.currentState?.instantValue.toString());
        },
        child: const Text('Login'),
      )
    ];
  }
}