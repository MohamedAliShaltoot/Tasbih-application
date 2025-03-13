

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

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    _loadCounters();
  }

  Future<void> _loadCounters() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      sobhan = prefs.getInt('sobhan') ?? 0;
      alhamd = prefs.getInt('alhamd') ?? 0;
      laaaelaha = prefs.getInt('laaaelaha') ?? 0;
      alla = prefs.getInt('alla') ?? 0;
    });
  }

  Future<void> _updateCounter(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

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

  void _checkMilestone(int count, String message) {
    if (count % 100 == 0 && count > 0) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.scale,
        title: 'Congratulations!',
        desc: message,
        btnOkOnPress: () {},
        btnOkColor: Colors.green,
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasbiha"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                widget.onToggle!();
              });
            },
            icon: const Icon(Icons.brightness_6_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            /// 🔹 **الصناديق الأربعة القديمة**
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _tasbihBox("سبحان الله", sobhan),
                _tasbihBox("الحمد لله", alhamd),
                _tasbihBox("لا إله إلا الله", laaaelaha),
                _tasbihBox("الله أكبر", alla),
              ],
            ),
            const SizedBox(height: 20),

            /// 🔹 **الرسم البياني مع الحدود**
            Container(
              height: 200,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: BarChart(
                BarChartData(
                  borderData: FlBorderData(show: false),
                  barGroups: [
                    _barData(0, sobhan.toDouble(), Colors.blue),
                    _barData(1, alhamd.toDouble(), Colors.orange),
                    _barData(2, laaaelaha.toDouble(), Colors.green),
                    _barData(3, alla.toDouble(), Colors.red),
                  ],
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(),
                    rightTitles: AxisTitles(),
                    topTitles: AxisTitles(),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          List<String> labels = [
                            "سبحان",
                            "الحمد",
                            "لا إله",
                            "الله"
                          ];
                          return Text(labels[value.toInt()],
                              style: const TextStyle(fontSize: 14));
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// 🔹 **الأزرار القديمة مع التحديث**
            _tasbihButton(
                "سبحان الله",
                "sobhan",
                () => setState(() {
                      sobhan++;
                      _updateCounter("sobhan", sobhan);
                      _checkMilestone(
                          sobhan, "You've reached $sobhan in سبحان الله!");
                    })),
            const SizedBox(height: 10),
            _tasbihButton(
                "الحمد لله",
                "alhamd",
                () => setState(() {
                      alhamd++;
                      _updateCounter("alhamd", alhamd);
                      _checkMilestone(
                          alhamd, "You've reached $alhamd in الحمد لله!");
                    })),
            const SizedBox(height: 10),
            _tasbihButton(
                "لا إله إلا الله",
                "laaaelaha",
                () => setState(() {
                      laaaelaha++;
                      _updateCounter("laaaelaha", laaaelaha);
                      _checkMilestone(laaaelaha,
                          "You've reached $laaaelaha in لا إله إلا الله!");
                    })),
            const SizedBox(height: 10),
            _tasbihButton(
                "الله أكبر",
                "alla",
                () => setState(() {
                      alla++;
                      _updateCounter("alla", alla);
                      _checkMilestone(
                          alla, "You've reached $alla in الله أكبر!");
                    })),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _resetCounters,
              child:
                  const Text("إعادة التصفير", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tasbihBox(String label, int count) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label,
              style: const TextStyle(fontSize: 14, color: Colors.white)),
          const SizedBox(height: 5),
          Text(count.toString(),
              style: const TextStyle(fontSize: 20, color: Colors.white)),
        ],
      ),
    );
  }

  BarChartGroupData _barData(int x, double y, Color color) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(toY: y, color: color, width: 15),
      ],
    );
  }

  Widget _tasbihButton(String text, String key, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        backgroundColor: Colors.deepPurple,
      ),
      onPressed: onPressed,
      child:
          Text(text, style: const TextStyle(fontSize: 18, color: Colors.white)),
    );
  }
}


// import 'package:Tasbiha/localization.dart';

// import 'package:fl_chart/fl_chart.dart';
// import 'package:Tasbiha/customWidgets/expanded_countainer.dart';
// import 'package:Tasbiha/customWidgets/outlined_primary_button.dart';
// import 'package:Tasbiha/customWidgets/primary_button_widget.dart';
// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key, required this.onToggleLanguage, required Null Function() onToggleLocale});
//   final VoidCallback onToggleLanguage;

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int sobhan = 0, alhamd = 0, laaaelaha = 0, alla = 0;

//   @override
//   void initState() {
//     super.initState();
//     _loadCounters();
//   }

//   Future<void> _loadCounters() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       sobhan = prefs.getInt('sobhan') ?? 0;
//       alhamd = prefs.getInt('alhamd') ?? 0;
//       laaaelaha = prefs.getInt('laaaelaha') ?? 0;
//       alla = prefs.getInt('alla') ?? 0;
//     });
//   }

//   void _incrementCounter(String key) {
//     setState(() {
//       switch (key) {
//         case 'sobhan':
//           sobhan++;
//           break;
//         case 'alhamd':
//           alhamd++;
//           break;
//         case 'laaaelaha':
//           laaaelaha++;
//           break;
//         case 'alla':
//           alla++;
//           break;
//       }
//     });

//     if (_getCounterValue(key) % 100 == 0) {
//       AwesomeDialog(
//         context: context,
//         dialogType: DialogType.success,
//         animType: AnimType.rightSlide,
//         title: LocalizationService.translate("congratulations"),
//         desc: LocalizationService.translate("reachCount", {
//           'value': _getCounterValue(key),
//           'text': LocalizationService.translate(key)
//         }),
//         btnOkText: LocalizationService.translate("continue"),
//         btnOkOnPress: () {},
//       ).show();
//     }
//   }

//   int _getCounterValue(String key) {
//     switch (key) {
//       case 'sobhan':
//         return sobhan;
//       case 'alhamd':
//         return alhamd;
//       case 'laaaelaha':
//         return laaaelaha;
//       case 'alla':
//         return alla;
//       default:
//         return 0;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(LocalizationService.translate("appTitle")),
//         actions: [
//           IconButton(
//             onPressed: widget.onToggleLanguage,
//             icon: const Icon(Icons.language),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           _buildTasbihButton("subhanAllah", "sobhan"),
//           _buildTasbihButton("alhamdulillah", "alhamd"),
//           _buildTasbihButton("laIlahaIllallah", "laaaelaha"),
//           _buildTasbihButton("allahuAkbar", "alla"),
//         ],
//       ),
//     );
//   }

//   Widget _buildTasbihButton(String textKey, String key) {
//     return OutlinedPrimaryButton(
//       buttonName: LocalizationService.translate(textKey),
//       onPressed: () => _incrementCounter(key),
//     );
//   }
// }


/*

// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'package:fl_chart/fl_chart.dart';
import 'package:Tasbiha/customWidgets/expanded_countainer.dart';
import 'package:Tasbiha/customWidgets/outlined_primary_button.dart';
import 'package:Tasbiha/customWidgets/primary_button_widget.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {super.key, this.onToggle, required void Function() onToggleLocale});
  final Function? onToggle;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int sobhan = 0, alhamd = 0, laaaelaha = 0, alla = 0;
  bool showGraph = false;
  bool isFirstLaunch = false;

  @override
  void initState() {
    super.initState();
    _checkFirstLaunch();
    _loadCounters();
  }

  Future<void> _checkFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    isFirstLaunch = prefs.getBool('firstLaunch') ?? true;
    if (isFirstLaunch) {
      Future.delayed(const Duration(milliseconds: 500), () {
        AwesomeDialog(
          // ignore: use_build_context_synchronously
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.scale,
          title: "👋 مرحبًا بك!",
          desc: "هذا هو تطبيق التسبيح، يمكنك متابعة عدد تسبيحاتك هنا.",
          btnOkText: "ابدأ الآن",
          btnOkOnPress: () {},
        ).show();
      });
      prefs.setBool('firstLaunch', false);
    }
  }

  Future<void> _loadCounters() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      sobhan = prefs.getInt('sobhan allah') ?? 0;
      alhamd = prefs.getInt('alhamd lillah') ?? 0;
      laaaelaha = prefs.getInt('laaaelaha ela allah') ?? 0;
      alla = prefs.getInt('alla akbar') ?? 0;
    });
  }

  Future<void> _updateCounter(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

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

  void _incrementCounter(String key) {
    setState(() {
      switch (key) {
        case 'sobhan allah':
          sobhan++;
          break;
        case 'alhamd lillah':
          alhamd++;
          break;
        case 'laaaelaha ela allah':
          laaaelaha++;
          break;
        case 'alla akbar':
          alla++;
          break;
      }
      _updateCounter(key, _getCounterValue(key));
    });

    Future.delayed(const Duration(microseconds: 10), () {
      _showDialogIfNeeded(_getCounterValue(key), key);
    });
  }

  void _showDialogIfNeeded(int value, String text) {
    if (value % 100 == 0) {
      Future.delayed(const Duration(seconds: 1), () {
        AwesomeDialog(
          // ignore: use_build_context_synchronously
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.rightSlide,
          title: "🎉 تهانينا",
          desc: "تهانينا لقد وصلت الي '$value'  من '$text'  ",
          descTextStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 23),

          btnOkText: "Continue / متابعة",
          btnOkIcon: Icons.thumb_up,
          btnOkOnPress: () {},
        ).show();
      });
    }
  }

  int _getCounterValue(String key) {
    switch (key) {
      case 'sobhan allah':
        return sobhan;
      case 'alhamd lillah':
        return alhamd;
      case 'laaaelaha ela allah':
        return laaaelaha;
      case 'alla akbar':
        return alla;
      default:
        return 0;
    }
  }

  @override
  // ignore: non_constant_identifier_names
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.sizeOf(context).width;
    double heightScreen = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        title: 
        Text("Tasbiha", style: TextStyle(fontSize: 30)),

        actions: [
          IconButton(
            onPressed: () => widget.onToggle!(),
            icon: const Icon(Icons.brightness_6_outlined),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                showGraph = !showGraph;
              });
            },
            icon: Icon(showGraph ? Icons.list : Icons.bar_chart),
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
              if (!showGraph)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ExpandedCountainerWidget("سبحان الله", sobhan),
                    ExpandedCountainerWidget("الحمد لله", alhamd),
                    ExpandedCountainerWidget("لاإله إلاالله", laaaelaha),
                    ExpandedCountainerWidget("الله أكبر", alla),
                  ],
                ),
              const SizedBox(height: 40),
              if (showGraph)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: 250,
                    padding: const EdgeInsets.all(10),
                    child: BarChart(
                      BarChartData(
                        borderData: FlBorderData(show: true),
                        gridData: FlGridData(
                          show: true,
                          drawVerticalLine: true,
                          drawHorizontalLine: true,
                          getDrawingHorizontalLine: (value) => FlLine(
                            color: Colors.white.withOpacity(0.5),
                            strokeWidth: 1,
                          ),
                          getDrawingVerticalLine: (value) => FlLine(
                            color: Colors.white.withOpacity(0.5),
                            strokeWidth: 1,
                          ),
                        ),
                        titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 40,
                              getTitlesWidget: (double value, TitleMeta meta) {
                                List<String> labels = [
                                  "سبحان الله",
                                  "الحمد لله",
                                  "لا إله إلا الله",
                                  "الله أكبر"
                                ];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(labels[value.toInt()],
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.white)),
                                );
                              },
                            ),
                          ),
                        ),
                        barGroups: [
                          BarChartGroupData(x: 0, barRods: [
                            BarChartRodData(
                                toY: sobhan.toDouble(), color: Colors.red),
                          ]),
                          BarChartGroupData(x: 1, barRods: [
                            BarChartRodData(
                                toY: alhamd.toDouble(), color: Colors.green),
                          ]),
                          BarChartGroupData(x: 2, barRods: [
                            BarChartRodData(
                                toY: laaaelaha.toDouble(),
                                color: Colors.orange),
                          ]),
                          BarChartGroupData(x: 3, barRods: [
                            BarChartRodData(
                                toY: alla.toDouble(), color: Colors.blue),
                          ]),
                        ],
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 40),
              _buildTasbihButton("سبحان الله", "sobhan allah"),
              const SizedBox(height: 15),
              _buildTasbihButton("الحمد لله", "alhamd lillah"),
              const SizedBox(height: 15),
              _buildTasbihButton("لا إله إلا الله", "laaaelaha ela allah"),
              const SizedBox(height: 15),
              _buildTasbihButton("الله أكبر", "alla akbar"),
              const SizedBox(height: 55),
              CustomPrimaryButton(
                buttonName: "Reset / تصفير",
                textButtonColor: Colors.white,
                buttonBackgroundColor: const Color.fromARGB(255, 4, 121, 125),
                onPressed: _resetCounters,
                borderButtonRadius: 25,
                fontSize: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTasbihButton(String text, String key) {
    return OutlinedPrimaryButton(
      buttonName: text,
      textButtonColor: Colors.white,
      buttonBorderColor: Colors.blueAccent,
      onPressed: () => _incrementCounter(key),
      borderButtonRadius: 25,
    );
  }
}

*/