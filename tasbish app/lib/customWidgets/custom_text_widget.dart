import 'package:flutter/material.dart';


class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    required this.label,
    this.fontsize = 20, required FontWeight fontWeight,
  });
  final String label;
  final double? fontsize;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(color: const Color.fromARGB(255, 242, 241, 238), fontSize: fontsize),
      textAlign: TextAlign.center,
    );
  }
}

/*
Shimmer.fromColors(
      baseColor: Colors.red,
    highlightColor: Colors.yellow,
      child: Text(
        label,
        style: TextStyle(color: Colors.amber, fontSize: fontsize),
        textAlign: TextAlign.center,
      ),
    );

*/