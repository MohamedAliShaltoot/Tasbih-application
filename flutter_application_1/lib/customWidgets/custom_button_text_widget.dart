import 'package:flutter/material.dart';

class CustomBottonTextWIdget extends StatelessWidget {
  const CustomBottonTextWIdget({
    super.key, required this.text, required this.color, this.fontsize=16,
  });
final String text;
final Color color;
final double? fontsize;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:  TextStyle(color: color,fontSize: fontsize,fontFamily: "ElMessiri-Bold"),
      textAlign: TextAlign.center,
    );
  }
}

// Color.fromARGB(255, 211, 12, 12)