import 'package:flutter/material.dart';

class CustomBottonTextWIdget extends StatelessWidget {
  const CustomBottonTextWIdget({
    super.key, required this.text,
  });
final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: Color.fromARGB(255, 211, 12, 12)),
      textAlign: TextAlign.center,
    );
  }
}