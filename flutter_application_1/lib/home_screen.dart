import 'package:flutter/material.dart';
import 'package:flutter_application_1/customWidgets/custom_button_text_widget.dart';
import 'package:flutter_application_1/customWidgets/custom_text_widget.dart';
import 'package:flutter_application_1/customWidgets/expanded_countainer.dart';
import 'package:flutter_application_1/provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
        backgroundColor: const Color.fromARGB(255, 227, 169, 70),
        title: const Text(
          "Tasbih app",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        actions: const [
          Icon(Icons.menu, size: 40, grade: 100, color: Colors.black)
        ],
      ),
      body: SafeArea(
        child: Container(
          color: const Color.fromARGB(255, 32, 35, 50),
          width: widthScreen,
          height: heightScreen,
          padding: const EdgeInsets.only(top: 5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ExpandedCountainerWidget("سبحان الله", sobhan),
                  ExpandedCountainerWidget("الحمد لله", alhamd),
                  ExpandedCountainerWidget("  لا اله الا الله", laaaelaha),
                  ExpandedCountainerWidget("  الله أكبر", alla),
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              ElevatedButton(
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
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                  alhamd++;
                },
                child: const CustomBottonTextWIdget(
                  text: " الحمد لله",
                  color: Color.fromARGB(255, 19, 13, 2),
                  fontsize: 30,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
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
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
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
            ],
          ),
        ),
      ),
    );
  }
}
