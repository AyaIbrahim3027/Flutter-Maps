import 'package:flutter/material.dart';

class BuildVerifyButton extends StatelessWidget {
  const BuildVerifyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: (){},
        style: ElevatedButton.styleFrom(
          minimumSize:const Size(110, 50),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6),),),
        child: const Text('Verify',
          style: TextStyle(color: Colors.white, fontSize: 16,),),
      ),
    );
  }
}
