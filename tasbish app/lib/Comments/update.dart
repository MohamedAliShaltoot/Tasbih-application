
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeScreen3 extends StatefulWidget {
  const HomeScreen3({super.key, this.onToggle});
  final Function? onToggle;

  @override
  State<HomeScreen3> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen3> {
  int sobhan = 0;
  int alhamd = 0;
  int laaaelaha = 0;
  int alla = 0;
  final int _maxCount = 100; // الحد الأقصى قبل ظهور الإشعار

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

    if (value >= _maxCount) {
      _showCompletionDialog(key);
    }
  }

  void _showCompletionDialog(String key) {
    String message = "لقد أكملت $_maxCount تسبيحة لـ ";
    switch (key) {
      case 'sobhan':
        message += "سبحان الله!";
        break;
      case 'alhamd':
        message += "الحمد لله!";
        break;
      case 'laaaelaha':
        message += "لا إله إلا الله!";
        break;
      case 'alla':
        message += "الله أكبر!";
        break;
    }

    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.topSlide,
      title: "تهانينا!",
      desc: message,
      btnOkOnPress: () {},
    ).show();
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

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Tasbiha",
          style: TextStyle(fontSize: 30),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       setState(() {
        //         widget.onToggle!();
        //       });
        //     },
        //     icon: const Icon(
        //       Icons.brightness_6_outlined,
        //       color: Colors.white,
        //     ),
        //   )
        // ],

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          color: const Color(0xFF202332),
          width: widthScreen,
          height: heightScreen,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // 🎯 **رسم المخطط البياني**
              SizedBox(
                height: 200,
                child: BarChart(
                  BarChartData(
                    barGroups: [
                      _buildBarChartGroup(0, sobhan, Colors.blue),
                      _buildBarChartGroup(1, alhamd, Colors.green),
                      _buildBarChartGroup(2, laaaelaha, Colors.orange),
                      _buildBarChartGroup(3, alla, Colors.red),
                    ],
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: true, interval: 10),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            switch (value.toInt()) {
                              case 0:
                                return _buildBottomTitle("سبحان الله");
                              case 1:
                                return _buildBottomTitle("الحمد لله");
                              case 2:
                                return _buildBottomTitle("لا إله إلا الله");
                              case 3:
                                return _buildBottomTitle("الله أكبر");
                              default:
                                return Container();
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 🎯 **أزرار التسبيح**
              _buildTasbihButton(
                  "سبحان الله", "sobhan", () => setState(() => sobhan++)),
              const SizedBox(height: 15),
              _buildTasbihButton(
                  "الحمد لله", "alhamd", () => setState(() => alhamd++)),
              const SizedBox(height: 15),
              _buildTasbihButton("لا إله إلا الله", "laaaelaha",
                  () => setState(() => laaaelaha++)),
              const SizedBox(height: 15),
              _buildTasbihButton(
                  "الله أكبر", "alla", () => setState(() => alla++)),
              const SizedBox(height: 30),

              // 🎯 **زر إعادة التصفير**
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: _resetCounters,
                child: const Text(
                  "إعادة التصفير",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ✅ **زر التسبيح مع التحديث الفوري**
  Widget _buildTasbihButton(String text, String key, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      onPressed: () {
        onPressed();
        _updateCounter(key, _getCounterValue(key));
      },
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }

  /// ✅ **رسم شريط لكل نوع تسبيح**
  BarChartGroupData _buildBarChartGroup(int x, int value, Color color) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(toY: value.toDouble(), color: color, width: 20),
      ],
    );
  }

  /// ✅ **إرجاع قيمة التسبيح بناءً على المفتاح**
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

  Widget _buildBottomTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child:
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 12)),
    );
  }
}
