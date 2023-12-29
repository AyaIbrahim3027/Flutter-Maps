import 'package:flutter/material.dart';

class BuildIntroTexts extends StatelessWidget {
  const BuildIntroTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('What is your phone number?',style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),),
        const SizedBox(height: 30,),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          child: const Text(
            'Please Enter your phone number to verify your account.',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}

