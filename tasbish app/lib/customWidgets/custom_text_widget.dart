import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    required this.label,
    this.fontsize = 17,
  });
  final String label;
  final double? fontsize;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.red,
    highlightColor: Colors.yellow,
      child: Text(
        label,
        style: TextStyle(color: Colors.amber, fontSize: fontsize),
        textAlign: TextAlign.center,
      ),
    );
  }
}
