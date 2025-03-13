// ignore_for_file: deprecated_member_use

import 'package:Tasbiha/localization.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:Tasbiha/customWidgets/expanded_countainer.dart';
import 'package:Tasbiha/customWidgets/outlined_primary_button.dart';
import 'package:Tasbiha/customWidgets/primary_button_widget.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.onToggleTheme,
    required this.onToggleLanguage,
    required Null Function() onToggleLocale,
  });

  final VoidCallback onToggleTheme;
  final VoidCallback onToggleLanguage;

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

  /// **🔹 فحص أول تشغيل للتطبيق وعرض رسالة ترحيبية**
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
          title: LocalizationService.translate("welcome"),
          desc: LocalizationService.translate("welcomeMessage"),
          btnOkText: LocalizationService.translate("start"),
          btnOkOnPress: () {},
        ).show();
      });
      prefs.setBool('firstLaunch', false);
    }
  }

  /// **🔹 تحميل الأعداد المحفوظة عند تشغيل التطبيق**
  Future<void> _loadCounters() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      sobhan = prefs.getInt('sobhan') ?? 0;
      alhamd = prefs.getInt('alhamd') ?? 0;
      laaaelaha = prefs.getInt('laaaelaha') ?? 0;
      alla = prefs.getInt('alla') ?? 0;
    });
  }

  /// **🔹 تحديث القيم عند الضغط**
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

    Future.delayed(const Duration(milliseconds: 200), () {
      _showDialogIfNeeded(_getCounterValue(key), key);
    });
  }

  /// **🔹 حفظ الأعداد في `SharedPreferences`**
  Future<void> _updateCounter(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  /// **🔹 إعادة التصفير**
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

  /// **🔹 عرض حوار عند الوصول إلى 100، 200، 300...**
  void _showDialogIfNeeded(int value, String key) {
    if (value % 100 == 0) {
      Future.delayed(const Duration(milliseconds: 300), () {
        Vibration.vibrate(duration: 300);
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.rightSlide,
          title: LocalizationService.translate("congratulations"),
          desc: LocalizationService.translate("reachCount",
              {'value': value, 'text': LocalizationService.translate(key)}),
          btnOkText: LocalizationService.translate("continue"),
          btnOkOnPress: () {},
        ).show();
      });
    }
  }

  /// **🔹 إرجاع العدد المناسب لكل مفتاح**
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
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(LocalizationService.translate("appTitle"),
                style: TextStyle(fontSize: 29)),
            SizedBox(width: 10),
            Image.asset(
              "assets/images/ic_sebha.png",
              //color: const Color.fromARGB(255, 15, 15, 15),
              height: 55,
              width: 55,
            ),
          ],
        ),
        actions: [
          MovableAppBar(
            onToggleTheme: widget.onToggleTheme,
            onToggleLanguage: widget.onToggleLanguage,
            onToggleGraph: () {
              setState(() {
                showGraph = !showGraph;
              });
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            if (!showGraph)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ExpandedCountainerWidget(
                      LocalizationService.translate("subhanAllah"), sobhan),
                  ExpandedCountainerWidget(
                      LocalizationService.translate("alhamdulillah"), alhamd),
                  ExpandedCountainerWidget(
                      LocalizationService.translate("laIlahaIllallah"),
                      laaaelaha),
                  ExpandedCountainerWidget(
                      LocalizationService.translate("allahuAkbar"), alla),
                ],
              ),
            const SizedBox(height: 40),
            if (showGraph)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 240, 239, 239),
                        width: 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 290,
                  padding: const EdgeInsets.all(10),
                  child: BarChart(
                    BarChartData(
                      borderData: FlBorderData(show: true),
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: true,
                        drawHorizontalLine: true,
                        getDrawingHorizontalLine: (value) => FlLine(
                          color: const Color.fromARGB(255, 241, 242, 246)
                              .withOpacity(0.5),
                          strokeWidth: 2,
                        ),
                        getDrawingVerticalLine: (value) => FlLine(
                          color: const Color.fromARGB(255, 241, 242, 246)
                              .withOpacity(0.5),
                          strokeWidth: 2,
                        ),
                      ),
                      titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 50, // زيادة المساحة لتوضيح النصوص
                              getTitlesWidget: (double value, TitleMeta meta) {
                                List<List<String>> labels = [
                                  ["سبحان", "الله"],
                                  ["الحمد", "لله"],
                                  ["لا إله", "إلا الله"],
                                  ["الله", "أكبر"]
                                ];

                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 3),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        labels[value.toInt()][0], // السطر الأول
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        labels[value.toInt()]
                                            [1], // السطر الثاني
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(
                                          height:
                                              0), // مسافة إضافية بين النص والرسم
                                      // Container(
                                      //   width: 6,
                                      //   height: 6,
                                      //   decoration: const BoxDecoration(
                                      //     shape: BoxShape.circle,
                                      //     color: Colors.white,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ),
                      barGroups: [
                        BarChartGroupData(x: 0, barRods: [
                          BarChartRodData(
                              toY: sobhan.toDouble(),
                              color: Colors.red,
                              width: 16,
                              borderRadius: BorderRadius.circular(1)),
                        ]),
                        BarChartGroupData(x: 1, barRods: [
                          BarChartRodData(
                              toY: alhamd.toDouble(),
                              color: Colors.green,
                              width: 16,
                              borderRadius: BorderRadius.circular(1)),
                        ]),
                        BarChartGroupData(x: 2, barRods: [
                          BarChartRodData(
                              toY: laaaelaha.toDouble(),
                              color: Colors.orange,
                              width: 16,
                              borderRadius: BorderRadius.circular(1)),
                        ]),
                        BarChartGroupData(x: 3, barRods: [
                          BarChartRodData(
                              toY: alla.toDouble(),
                              color: Colors.blue,
                              width: 16,
                              borderRadius: BorderRadius.circular(1)),
                        ]),
                      ],
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 40),
            _buildTasbihButton(
                LocalizationService.translate('subhanAllah'), "sobhan"),
            const SizedBox(height: 15),
            _buildTasbihButton(
                LocalizationService.translate('alhamdulillah'), "alhamd"),
            const SizedBox(height: 15),
            _buildTasbihButton(
                LocalizationService.translate('laIlahaIllallah'), "laaaelaha"),
            const SizedBox(height: 15),
            _buildTasbihButton(
                LocalizationService.translate('allahuAkbar'), "alla"),
            const SizedBox(height: 55),
            CustomPrimaryButton(
              buttonName: LocalizationService.translate('reset'),
              textButtonColor: Colors.white,
              buttonBackgroundColor: const Color.fromARGB(255, 4, 121, 125),
              onPressed: _resetCounters,
              borderButtonRadius: 25,
              fontSize: 30,
            ),
          ],
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

class MovableAppBar extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final VoidCallback onToggleLanguage;
  final VoidCallback onToggleGraph;

  const MovableAppBar({
    super.key,
    required this.onToggleTheme,
    required this.onToggleLanguage,
    required this.onToggleGraph,
  });

  @override
  State<MovableAppBar> createState() => _MovableAppBarState();
}

class _MovableAppBarState extends State<MovableAppBar> {
  List<Map<String, dynamic>> icons = [];

  @override
  void initState() {
    super.initState();
    icons = [
      {
        'icon': Icons.brightness_6_outlined,
        'action': widget.onToggleTheme,
      },
      {
        'icon': Icons.bar_chart,
        'action': widget.onToggleGraph,
      },
      {
        'icon': Icons.language,
        'action': widget.onToggleLanguage,
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: icons.asMap().entries.map((entry) {
        int index = entry.key;
        var item = entry.value;

        return Draggable<Map<String, dynamic>>(
          data: item,
          feedback: Material(
            color: Colors.transparent,
            child: Icon(item['icon'], size: 40, color: Colors.blueAccent),
          ),
          childWhenDragging: const SizedBox.shrink(),
          onDragCompleted: () {},
          child: DragTarget<Map<String, dynamic>>(
            onAccept: (draggedItem) {
              setState(() {
                int oldIndex = icons.indexOf(draggedItem);
                icons.removeAt(oldIndex);
                icons.insert(index, draggedItem);
              });
            },
            builder: (context, candidateData, rejectedData) {
              return IconButton(
                icon: Icon(item['icon'], size: 30),
                onPressed: () => item['action'](),
              );
            },
          ),
        );
      }).toList(),
    );
  }
}
