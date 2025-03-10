// ignore_for_file: deprecated_member_use
import 'dart:ui';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/customWidgets/custom_button_text_widget.dart';

class NewHomeScreen extends StatefulWidget {
  const NewHomeScreen({super.key, this.onToggle});
  final Function? onToggle;

  @override
  State<NewHomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<NewHomeScreen> {
  int sobhan = 0;
  int alhamd = 0;
  int laaaelaha = 0;
  int alla = 0;

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.sizeOf(context).width;
    double heightScreen = MediaQuery.sizeOf(context).height;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 20,
        splashColor: Colors.orange,
        tooltip: "إعادة التصفير",
        backgroundColor: Colors.amber,
        onPressed: () {
          setState(() {
            sobhan = 0;
            alhamd = 0;
            laaaelaha = 0;
            alla = 0;
          });
        },
        child: const CustomBottonTextWIdget(
          text: "تصفير",
          color: Colors.black,
          fontsize: 20,
        ),
      ),
      appBar: AppBar(
        title: InkWell(
          onTap: () {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.info,
              animType: AnimType.rightSlide,
              title: 'معلومة عني',
              desc: 'أنا محمد علي "المطور"!',
              btnCancelOnPress: () {},
              btnOkOnPress: () {},
            ).show();
          },
          child: const Text(
            "تطبيق التسبيح",
            style: TextStyle(fontSize: 30),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                widget.onToggle!();
              });
            },
            icon: const Icon(Icons.brightness_6_outlined),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1A2980), Color(0xFF26D0CE)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          width: widthScreen,
          height: heightScreen,
          child: Column(
            children: [
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildGlassmorphicCounter("سبحان الله", sobhan),
                  buildGlassmorphicCounter("الحمد لله", alhamd),
                  buildGlassmorphicCounter("لا إله إلا الله", laaaelaha),
                  buildGlassmorphicCounter("الله أكبر", alla),
                ],
              ),
              const SizedBox(height: 80),
              buildTasbihButton("سبحان الله", () => setState(() => sobhan++)),
              const SizedBox(height: 20),
              buildTasbihButton("الحمد لله", () => setState(() => alhamd++)),
              const SizedBox(height: 20),
              buildTasbihButton(
                  "لا إله إلا الله", () => setState(() => laaaelaha++)),
              const SizedBox(height: 20),
              buildTasbihButton("الله أكبر", () => setState(() => alla++)),
            ],
          ),
        ),
      ),
    );
  }

  /// ✅ **مكون لإنشاء الحاوية الزجاجية (Glassmorphism) لكل عداد**
  Widget buildGlassmorphicCounter(String text, int count) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(12),
          width: 90,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color.fromARGB(255, 196, 16, 16).withOpacity(0.2), width: 2),
            color: Colors.white.withOpacity(0.1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "$count",
                style: const TextStyle(
                    color: Colors.amberAccent,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ✅ **مكون لإنشاء زر التسبيح مع تأثيرات جميلة**
  Widget buildTasbihButton(String text, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(30),
      splashColor: Colors.amberAccent.withOpacity(0.5),
      child: Container(
        width: 220,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [Colors.deepOrangeAccent, Colors.orange],
          ),
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, blurRadius: 5, offset: Offset(2, 3)),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
