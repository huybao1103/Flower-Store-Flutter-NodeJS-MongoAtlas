import 'package:flower_store/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginForm = GlobalKey<FormBuilderState>();

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
                'Đăng Nhập',
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
                key: _loginForm,
                child: Column(
                  children: [
                    FormBuilderTextField(
                      name: 'email',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ]),
                      decoration: InputDecoration(
                        label: Title(
                        color: Colors.grey, child: const Text('Email')),
                        border: const OutlineInputBorder()
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FormBuilderTextField(
                      name: 'password',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                      decoration: const InputDecoration(
                          labelText: 'Password', border: OutlineInputBorder()),
                    ),
                    MaterialButton(
                      color: Theme.of(context).colorScheme.secondary,
                      onPressed: () {
                        // Validate and save the form values
                        _loginForm.currentState?.saveAndValidate();
                        debugPrint(_loginForm.currentState?.value.toString());

                        // On another side, can access all field values without saving form with instantValues
                        _loginForm.currentState?.validate();
                        debugPrint(
                            _loginForm.currentState?.instantValue.toString());
                      },
                      child: const Text('Login'),
                    )
                  ],
                )),
          ],
        ),
        )
      ),
    );
  }
}
