import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key, required this.label, this.fontsize=17,
  });
final String label;
final double? fontsize;
  @override
  Widget build(BuildContext context) {
    return  Text(label,style:  TextStyle(color: Colors.amber,fontSize:fontsize,fontFamily: "ElMessiri-Bold"),textAlign: TextAlign.center,);
  }
}