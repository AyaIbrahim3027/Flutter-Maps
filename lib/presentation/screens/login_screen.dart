import 'package:flutter/material.dart';

import '../widgets/build_intro_texts.dart';
import '../widgets/build_next_button.dart';
import '../widgets/build_phone_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> phoneFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: phoneFormKey,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 88),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BuildIntroTexts(
                title: 'What is your phone number?',
                subTitle:
                    'Please Enter your phone number to verify your account.',
              ),
              const SizedBox(
                height: 110,
              ),
              BuildPhoneFormField(),
              const SizedBox(
                height: 30,
              ),
              const BuildNextButton(),
            ],
          ),
        ),
      ),
    ));
  }
}
