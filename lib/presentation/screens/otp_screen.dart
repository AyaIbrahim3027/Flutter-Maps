import 'package:flutter/material.dart';
import 'package:flutter_maps/presentation/widgets/build_intro_texts.dart';

import '../widgets/build_pin_code_field.dart';
import '../widgets/build_verify_button.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 88),
        child: const Column(
          children: [
            BuildIntroTexts(
              title: 'Verify your phone number',
              subTitle: 'Enter your 6 digit code numbers sent to ',
            ),
            SizedBox(
              height: 88,
            ),
            BuildPinCodeField(),
            SizedBox(
              height: 30,
            ),
            BuildVerifyButton(),
          ],
        ),
      ),
    ));
  }
}
