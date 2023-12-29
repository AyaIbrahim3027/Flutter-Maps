import 'package:flutter/material.dart';

class BuildNextButton extends StatelessWidget {
  const BuildNextButton({super.key});

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
        child: const Text('Next',
        style: TextStyle(color: Colors.white, fontSize: 16,),),
      ),
    );
  }
}
