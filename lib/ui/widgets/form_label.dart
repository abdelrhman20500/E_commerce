import 'package:flutter/material.dart';

class FormLabel extends StatelessWidget {
 String label;

 FormLabel({super.key, required this.label});
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
          fontSize: 18, color:Color(0xffffffff),fontWeight: FontWeight.w500),
    );
  }
}
