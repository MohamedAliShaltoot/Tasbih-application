import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/customWidgets/custom_text_widget.dart';

// ignore: non_constant_identifier_names

// ignore: non_constant_identifier_names
Expanded ExpandedCountainerWidget(String textLabel, int counter) {
  return Expanded(
    flex: 2,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 213, 200, 19)),
        color: const Color.fromARGB(255, 14, 8, 3),
      ),
      width: 20,
      height: 100,
      child: Column(
        children: [
          CustomTextWidget(label: textLabel),
          const SizedBox(
            height: 10,
          ),

           AnimatedFlipCounter(
            value: counter,
            duration: const Duration(seconds: 1),
            curve: Curves.linear,
           ),
          // Text(
          //   "$counter",
          //   style: const TextStyle(color: Color.fromARGB(255, 250, 234, 4)),
          //   textAlign: TextAlign.center,
          // ),
        ],
      ),
    ),
  );
}


          