import 'package:flutter/material.dart';
import 'package:flutter_application_1/customWidgets/custom_button_text_widget.dart';
import 'package:flutter_application_1/customWidgets/custom_text_widget.dart';

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
       double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
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
          actions: const [Icon(Icons.menu,size: 40,grade: 100,color: Colors.black)],
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
                    Expanded(
                      flex: 2,
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration:  BoxDecoration(
                             border: Border.all(
                                color: const Color.fromARGB(255, 213, 200, 19)),
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
                                height: 25,
                              ),
                              Text(
                                "$sobhan",
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 250, 234, 4)),
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
                                color: const Color.fromARGB(255, 213, 200, 19)),
                            color: const Color.fromARGB(255, 13, 13, 13),
                          ),
                          width: 20,
                          height: 100,
                          child: Column(
                            children: [
                              const CustomTextWidget(label: "الحمد لله"),
                              const SizedBox(
                                height: 25,
                              ),
                              Text(
                                "$alhamd",
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 250, 234, 4)),
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
                                color: const Color.fromARGB(255, 213, 200, 19)),
                            color: const Color.fromARGB(255, 19, 19, 18),
                          ),
                          width: 20,
                          height: 100,
                          child: Column(
                            children: [
                              const CustomTextWidget(label: "  لا اله الا الله"),
                              const SizedBox(
                                height: 25,
                              ),
                              Text(
                                "$laaaelaha",
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 250, 234, 4)),
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
                              color: const Color.fromARGB(255, 213, 200, 19)),
                          color: const Color.fromARGB(255, 22, 21, 21),
                        ),
                        width: 20,
                        height: 100,
                        child: Column(
                          children: [
                            const CustomTextWidget(label: "  الله أكبر"),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              "$alla",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 250, 234, 4)),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
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
                    color:  Color.fromARGB(255, 19, 13, 2),
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
                    color:  Color.fromARGB(255, 19, 13, 2),
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