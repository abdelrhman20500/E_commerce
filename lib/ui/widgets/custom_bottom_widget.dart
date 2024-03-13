import 'package:flutter/material.dart';

class CustomBottomWidget extends StatelessWidget{
String title;
Function()? onPressed;

CustomBottomWidget({super.key, required this.onPressed, required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: MaterialButton(
        color: const Color(0xffffffff),
        padding: const EdgeInsets.symmetric(vertical: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onPressed: onPressed,
        child: Text(title, style: const TextStyle(
            fontSize: 18, color: Color(0xff004182),
            fontWeight: FontWeight.w600),),
      ),
    );
  }
}

