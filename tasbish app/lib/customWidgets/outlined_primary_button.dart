

import 'package:flutter/material.dart';



class OutlinedPrimaryButton extends StatelessWidget {
  final String? buttonName;
  final Color? buttonBorderColor;
  final double? width, height;
  final double? borderButtonRadius;
  final Color? textButtonColor;
  final VoidCallback? onPressed;
  final double? fontSize;

  const OutlinedPrimaryButton(
      {super.key,
       this.buttonName,
       this.buttonBorderColor,
       this.width,
       this.height,
       this.borderButtonRadius,
       this.textButtonColor, this.onPressed, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
         elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderButtonRadius ?? 8),
            side: BorderSide(color:buttonBorderColor ?? Colors.white,width: 10),
          ),
          fixedSize: Size(width ?? 250, height ?? 56),
        ),
        onPressed:onPressed,
        child: Text(
          buttonName ?? " ",
          style: TextStyle(color: textButtonColor ,fontSize: fontSize ?? 22,fontWeight: FontWeight.bold),
        ),
        );
  }
}
