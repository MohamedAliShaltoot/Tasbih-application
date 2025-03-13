
import 'package:flutter/material.dart';


class CustomPrimaryButton extends StatelessWidget {
  final String? buttonName;
  final Color? buttonBackgroundColor;
  final double? width, height;
  final double? borderButtonRadius;
  final Color? textButtonColor;
  final VoidCallback? onPressed;
  final double? fontSize;

  const CustomPrimaryButton(
      {super.key,
      this.buttonName,
      this.buttonBackgroundColor,
      this.width,
      this.height,
      this.borderButtonRadius,
      this.textButtonColor,
      this.onPressed,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderButtonRadius ?? 8),
        ),
        fixedSize: Size(width ?? 300, height ?? 56),
      ),
      onPressed: onPressed,
      child: Text(
        buttonName ?? " ",
        style: TextStyle(
            color: textButtonColor ,
            fontSize: fontSize ?? 19,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
