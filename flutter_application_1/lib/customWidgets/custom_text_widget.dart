import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key, required this.label,
  });
final String label;
  @override
  Widget build(BuildContext context) {
    return  Text(label,style: const TextStyle(color: Colors.amber),textAlign: TextAlign.center,);
  }
}