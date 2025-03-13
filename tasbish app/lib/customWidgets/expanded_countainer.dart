import 'package:Tasbiha/customWidgets/custom_text_widget.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Expanded ExpandedCountainerWidget(String textLabel, int counter) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      margin: const EdgeInsets.symmetric(
          horizontal: 5), // تقليل الفجوات بين الصناديق
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF09203F), Color(0xFF537895)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.25),
            blurRadius: 6,
            spreadRadius: 1,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      height: 160, // تقليل الارتفاع قليلاً للحصول على توازن أفضل
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// 🔹 **النص العلوي (نوع الذكر)**
          CustomTextWidget(
            label: textLabel,
            fontsize: 18,
            fontWeight: FontWeight.w600,
          ),

          const SizedBox(height: 8),

          /// 🔹 **عداد الأذكار مع أيقونة السبحة**
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/ic_sebha.png",
                color: Colors.amber,
                height: 24,
                width: 24,
              ),
              const SizedBox(width: 6),
              AnimatedFlipCounter(
                textStyle: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                value: counter,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeOut,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
