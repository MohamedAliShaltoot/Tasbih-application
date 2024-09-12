import 'package:flutter/material.dart';
import 'package:flutter_application_1/custom_button_text_widget.dart';
import 'package:flutter_application_1/custom_text_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int ww = 0;
  int qq = 0;
  int ee = 0;
  int rr = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              ww = 0;
              qq = 0;
              ee = 0;
              rr = 0;
            });
          },
          child:const CustomBottonTextWIdget(text: "Reset", color: Colors.black,fontsize: 20,)
          
    
        ),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 227, 169, 70),
          title: const Text(
            "Tasbih app",
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ),
        body: Container(
          color: const Color.fromARGB(255, 16, 25, 106),
          width: MediaQuery.of(context).size.width,
          height:MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(10),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 8, 189, 20)),
                          color: const Color.fromARGB(255, 24, 24, 27),
                        ),
                        width: 20,
                        height: 100,
                        child: Column(
                          children: [
                            const CustomTextWidget(
                              label: "سبحان الله",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "$ww",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 226, 82, 5)),
                              textAlign: TextAlign.center,
                            )
                          ],
                        )),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 8, 189, 20)),
                          color: const Color.fromARGB(255, 13, 13, 13),
                        ),
                        width: 20,
                        height: 100,
                        child: Column(
                          children: [
                            const CustomTextWidget(label: "الحمد لله"),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "$qq",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 226, 82, 5)),
                              textAlign: TextAlign.center,
                            )
                          ],
                        )),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 8, 189, 20)),
                          color: const Color.fromARGB(255, 19, 19, 18),
                        ),
                        width: 20,
                        height: 100,
                        child: Column(
                          children: [
                            const CustomTextWidget(label: "  لا اله الا الله"),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "$ee",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 226, 82, 5)),
                              textAlign: TextAlign.center,
                            )
                          ],
                        )),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 8, 189, 20)),
                          color: const Color.fromARGB(255, 22, 21, 21),
                        ),
                        width: 20,
                        height: 100,
                        child: Column(
                          children: [
                            const CustomTextWidget(label: "  الله أكبر"),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "$rr",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 226, 82, 5)),
                              textAlign: TextAlign.center,
                            )
                          ],
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {});
                    ww++;
                  },
                  child: const CustomBottonTextWIdget(
                    text: "سبحان الله", color: Colors.red,
                  )),
              ElevatedButton(
                  onPressed: () {
                    setState(() {});
                    qq++;
                  },
                  child: const CustomBottonTextWIdget(text: " الحمد لله", color: Colors.red,)),
              ElevatedButton(
                  onPressed: () {
                    setState(() {});
                    ee++;
                  },
                  child:
                      const CustomBottonTextWIdget(text: " لا اله الا الله", color: Colors.red,)),
              ElevatedButton(
                  onPressed: () {
                    setState(() {});
                    rr++;
                  },
                  child: const CustomBottonTextWIdget(text: "  الله أكبر", color: Colors.red,)),
            ],
          ),
        ),
      ),
    );
  }
}
