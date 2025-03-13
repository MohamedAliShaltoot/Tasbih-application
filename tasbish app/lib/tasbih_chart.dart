import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TasbihChart extends StatelessWidget {
  final int sobhan;
  final int alhamd;
  final int laaaelaha;
  final int alla;

  const TasbihChart({
    super.key,
    required this.sobhan,
    required this.alhamd,
    required this.laaaelaha,
    required this.alla,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 100, // الحد الأقصى للمقياس، يمكنك تعديله حسب الحاجة
          barGroups: [
            BarChartGroupData(x: 0, barRods: [
              BarChartRodData(
                  toY: sobhan.toDouble(), color: Colors.blue, width: 16),
            ]),
            BarChartGroupData(x: 1, barRods: [
              BarChartRodData(
                  toY: alhamd.toDouble(), color: Colors.green, width: 16),
            ]),
            BarChartGroupData(x: 2, barRods: [
              BarChartRodData(
                  toY: laaaelaha.toDouble(), color: Colors.orange, width: 16),
            ]),
            BarChartGroupData(x: 3, barRods: [
              BarChartRodData(
                  toY: alla.toDouble(), color: Colors.red, width: 16),
            ]),
          ],
          titlesData: FlTitlesData(
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: true, reservedSize: 30),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (double value, TitleMeta meta) {
                  switch (value.toInt()) {
                    case 0:
                      return const Text("سبحان الله ");
                    case 1:
                      return const Text("الحمد لله ");
                    case 2:
                      return const Text("لا إله إلا الله     ");
                    case 3:
                      return const Text("الله أكبر ");
                    default:
                      return const Text("");
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
