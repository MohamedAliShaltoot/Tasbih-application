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
  const HomeScreen({super.key, this.onToggle});
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

  void _incrementCounter(String key) {
    setState(() {
      switch (key) {
        case 'sobhan':
          sobhan++;
          break;
        case 'alhamd':
          alhamd++;
          break;
        case 'laaaelaha':
          laaaelaha++;
          break;
        case 'alla':
          alla++;
          break;
      }
      _updateCounter(key, _getCounterValue(key));
    });

    Future.delayed(const Duration(milliseconds: 250), () {
      _showDialogIfNeeded(_getCounterValue(key), key);
    });
  }

  void _showDialogIfNeeded(int value, String text) {
    if (value % 100 == 0) {
      Future.delayed(const Duration(milliseconds: 300), () {
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

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.sizeOf(context).width;
    double heightScreen = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasbiha", style: TextStyle(fontSize: 30)),
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
              _buildTasbihButton("سبحان الله", "sobhan"),
              const SizedBox(height: 15),
              _buildTasbihButton("الحمد لله", "alhamd"),
              const SizedBox(height: 15),
              _buildTasbihButton("لا إله إلا الله", "laaaelaha"),
              const SizedBox(height: 15),
              _buildTasbihButton("الله أكبر", "alla"),
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
