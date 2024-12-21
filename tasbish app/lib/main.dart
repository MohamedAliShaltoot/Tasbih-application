import 'package:flutter/material.dart';

import 'package:flutter_application_1/provider.dart';
import 'package:flutter_application_1/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => IncrementCountersProvider(),
      child: const TasbishApp()));
}

class TasbishApp extends StatelessWidget {
  const TasbishApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
