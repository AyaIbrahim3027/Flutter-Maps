import 'package:flutter/material.dart';
import 'package:flutter_maps/constants/colors.dart';

class BuildIntroTexts extends StatelessWidget {
  const BuildIntroTexts({super.key, required this.title, required this.subTitle});

  final String title,subTitle;
  final phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(title,style: const TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),),
        const SizedBox(height: 30,),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          child: RichText(
            text: TextSpan(
              text: subTitle,
              style: const TextStyle(color: Colors.black,fontSize: 18,height: 1.4,),
              children: [
                TextSpan(
                  text: phoneNumber,
                  style: TextStyle(color: MyColors.blue,),
                ),
              ],
            ),
          ),
          // child:  Text(
          //   subTitle,
          //   style: const TextStyle(
          //     color: Colors.black,
          //     fontSize: 18,
          //     height: 1.4,
          //   ),
          // ),
        ),
      ],
    );
  }
}

