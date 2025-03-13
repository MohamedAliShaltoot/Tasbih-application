

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
