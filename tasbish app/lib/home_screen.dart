// ignore_for_file: deprecated_member_use

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/customWidgets/custom_button_text_widget.dart';
import 'package:flutter_application_1/customWidgets/expanded_countainer.dart';
import 'package:flutter_application_1/customWidgets/outlined_primary_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.onToggle});
  final Function? onToggle;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int sobhan = 0;
  int alhamd = 0;
  int laaaelaha = 0;
  int alla = 0;

  @override
  void initState() {
    super.initState();
    _loadCounters(); // تحميل القيم المحفوظة عند بدء التطبيق
  }

  /// 🔹 **تحميل القيم المحفوظة عند بدء التطبيق**
  Future<void> _loadCounters() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      sobhan = prefs.getInt('sobhan') ?? 0;
      alhamd = prefs.getInt('alhamd') ?? 0;
      laaaelaha = prefs.getInt('laaaelaha') ?? 0;
      alla = prefs.getInt('alla') ?? 0;
    });
  }

  /// 🔹 **تحديث القيم في `SharedPreferences` عند تغيير أي عدد**
  Future<void> _updateCounter(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  /// 🔹 **إعادة تصفير جميع القيم**
  Future<void> _resetCounters() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      sobhan = 0;
      alhamd = 0;
      laaaelaha = 0;
      alla = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.sizeOf(context).width;
    double heightScreen = MediaQuery.sizeOf(context).height;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 40,
        splashColor: Colors.orange,
        tooltip: "إعادة التصفير",
        backgroundColor: Colors.amber,
        onPressed: _resetCounters,
        child: const CustomBottonTextWIdget(
          text: "reset",
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
              title: 'Dialog Title',
              desc: 'My name is Mohamed Ali "The Developer" ',
              btnCancelOnPress: () {},
              btnOkOnPress: () {},
            ).show();
          },
          child: const Text(
            "Tasbih App",
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
            icon: const Icon(
              Icons.brightness_6_outlined,
              color: Color.fromARGB(255, 227, 226, 233),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          color: const Color.fromARGB(255, 32, 35, 50),
          width: widthScreen,
          height: heightScreen,
          padding: const EdgeInsets.only(top: 1),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ExpandedCountainerWidget("سبحان الله", sobhan),
                  ExpandedCountainerWidget("الحمد لله", alhamd),
                  ExpandedCountainerWidget("لاإله إلاالله", laaaelaha),
                  ExpandedCountainerWidget("الله أكبر", alla),
                ],
              ),
              const SizedBox(height: 120),
              _buildTasbihButton(
                  "سبحان الله", "sobhan", () => setState(() => sobhan++)),
              const SizedBox(height: 25),
              _buildTasbihButton(
                  "الحمد لله", "alhamd", () => setState(() => alhamd++)),
              const SizedBox(height: 25),
              _buildTasbihButton("لا إله إلا الله", "laaaelaha",
                  () => setState(() => laaaelaha++)),
              const SizedBox(height: 25),
              _buildTasbihButton(
                  "الله أكبر", "alla", () => setState(() => alla++)),
            ],
          ),
        ),
      ),
    );
  }

  /// ✅ **زر التسبيح الذي يتم تحديثه وحفظه في `SharedPreferences`**
  Widget _buildTasbihButton(String text, String key, VoidCallback onPressed) {
    return OutlinedPrimaryButton(
      buttonName: text,
      textButtonColor: const Color.fromARGB(255, 234, 232, 232),
      buttonBorderColor: const Color(0xFFDB3022),
      onPressed: () {
        onPressed(); // زيادة العداد
        _updateCounter(
            key, _getCounterValue(key)); // تحديث القيمة في `SharedPreferences`
      },
      borderButtonRadius: 25,
    );
  }

  /// ✅ **إرجاع قيمة العداد المناسبة بناءً على المفتاح**
  int _getCounterValue(String key) {
    switch (key) {
      case 'sobhan':
        return sobhan;
      case 'alhamd':
        return alhamd;
      case 'laaaelaha':
        return laaaelaha;
      case 'alla':
        return alla;
      default:
        return 0;
    }
  }
}


/*
// ignore_for_file: deprecated_member_use

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/customWidgets/custom_button_text_widget.dart';
import 'package:flutter_application_1/customWidgets/expanded_countainer.dart';
import 'package:flutter_application_1/customWidgets/outlined_primary_button.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.onToggle});
  final Function? onToggle;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int sobhan = 0;
  int alhamd = 0;
  int laaaelaha = 0;
  int alla = 0;

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.sizeOf(context).width;
    double heightScreen = MediaQuery.sizeOf(context).height;
    return Scaffold(
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
          focusElevation: 80,
          elevation: 40,
          splashColor: Colors.orange,
          focusColor: Colors.green,
          // hoverColor: const Color.fromARGB(255, 2, 238, 69),
          tooltip: "Rest Counters",
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
            text: "Reset",
            color: Colors.black,
            fontsize: 20,
          )),
      appBar: AppBar(
        //backgroundColor: Colors.orange,
        title: InkWell(
          onTap: () {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.info,
              animType: AnimType.rightSlide,
              title: 'Dialog Title',
              desc: 'My name is Mohamed Ali "The Developer" ',
              btnCancelOnPress: () {},
              btnOkOnPress: () {},
            ).show();

            //showAlertDialog(context); ----> add package instead of this
          },
          child: const Text(
            "Tasbih app",
            style: TextStyle(fontSize: 30),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                widget.onToggle!();
              });
              // final snakBar = ShowSnackBar(context);
              // ScaffoldMessenger.of(context).showSnackBar(snakBar);
            },
            icon: const Icon(Icons.brightness_6_outlined),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          color: const Color.fromARGB(255, 32, 35, 50),
          width: widthScreen,
          height: heightScreen,
          padding: const EdgeInsets.only(top: 1),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ExpandedCountainerWidget("سبحان الله", sobhan),
                  ExpandedCountainerWidget("الحمد لله", alhamd),
                  ExpandedCountainerWidget("لا اله الاالله", laaaelaha),
                  ExpandedCountainerWidget("  الله أكبر", alla),
                ],
              ),
              const SizedBox(
                height: 120,
              ),

              OutlinedPrimaryButton(
                buttonName: "سبحان الله",
                textButtonColor: const Color.fromARGB(255, 234, 232, 232),
                buttonBorderColor: const Color(0xFFDB3022),
                onPressed: () {
                  setState(() {});
                  sobhan++;
                },
                borderButtonRadius: 25,
              ),

              const SizedBox(
                height: 25,
              ),
              // CustomElevatedButton(alhamd,"الحمد لله"),

              OutlinedPrimaryButton(
                buttonName: "الحمد لله",
                textButtonColor: const Color.fromARGB(255, 234, 232, 232),
                buttonBorderColor: const Color(0xFFDB3022),
                onPressed: () {
                  setState(() {});
                  alhamd++;
                },
                borderButtonRadius: 25,
              ),

              const SizedBox(
                height: 25,
              ),

              OutlinedPrimaryButton(
                buttonName: " لا اله الا الله",
                textButtonColor: const Color.fromARGB(255, 234, 232, 232),
                buttonBorderColor: const Color(0xFFDB3022),
                onPressed: () {
                  setState(() {});
                  laaaelaha++;
                },
                borderButtonRadius: 25,
              ),

              const SizedBox(
                height: 25,
              ),

              OutlinedPrimaryButton(
                buttonName: "  الله أكبر",
                textButtonColor: const Color.fromARGB(255, 234, 232, 232),
                buttonBorderColor: const Color(0xFFDB3022),
                onPressed: () {
                  setState(() {});
                  alla++;
                },
                borderButtonRadius: 25,
              ),

              const SizedBox(
                height: 25,
              ),

              
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  ElevatedButton CustomElevatedButton(int counter, String text) {
    return ElevatedButton(
      style: const ButtonStyle(
        backgroundColor:
            MaterialStatePropertyAll<Color>(Color.fromARGB(255, 227, 169, 70)),
      ),
      onPressed: () {
        setState(() {
          counter++;
        });
      },
      child: CustomBottonTextWIdget(
        text: text,
        color: const Color.fromARGB(255, 19, 13, 2),
        fontsize: 30,
      ),
    );
  }
}


/*

 Shimmer.fromColors(
            period: const Duration(seconds: 4),
             baseColor: const Color.fromARGB(255, 31, 28, 28),
              highlightColor: const Color.fromARGB(255, 138, 124, 5),
            child: const Text(
              "Tasbih app",
              style: TextStyle( fontSize: 30),
            ),
          ),



===
  ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                      Color.fromARGB(255, 227, 169, 70)),
                ),
                onPressed: () {
                  setState(() {});
                  alla++;
                },
                child: const CustomBottonTextWIdget(
                  text: "  الله أكبر",
                  color: Color.fromARGB(255, 19, 13, 2),
                  fontsize: 30,
                ),
              ),



ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                      Color.fromARGB(255, 227, 169, 70)),
                ),
                onPressed: () {
                  setState(() {});
                  laaaelaha++;
                },
                child: const CustomBottonTextWIdget(
                  text: " لا اله الا الله",
                  color: Color.fromARGB(255, 19, 13, 2),
                  fontsize: 30,
                ),
              ),





 ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                      Color.fromARGB(255, 227, 169, 70)),
                ),
                onPressed: () {
                  setState(() {});
                  alhamd++;
                },
                child: const CustomBottonTextWIdget(
                  text: "الحمد لله",
                  color: Color.fromARGB(255, 19, 13, 2),
                  fontsize: 30,
                ),
              ),



 ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll<Color>(
                      Color.fromARGB(255, 227, 169, 70)),
                ),
                onPressed: () {
                  setState(() {});
                  sobhan++;
                },
                child: const CustomBottonTextWIdget(
                  text: "سبحان الله",
                  color: Color.fromARGB(255, 19, 13, 2),
                  fontsize: 30,
                ),
              ),













*/  

*/