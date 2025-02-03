import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:app/src/UIKit/financia_colors.dart';

class SpendingsIncomesChartController extends GetxController {
  final double width = 7;
  final Color leftBarColor = FinanciaColors.buttonSecondary.color;
  final Color rightBarColor = FinanciaColors.buttonPrimary.color;
  final Color avgColor = Colors.orange;

  final RxList<BarChartGroupData> showingBarGroups = <BarChartGroupData>[].obs;

  @override
  void onInit() {
    super.onInit();
    initializeBarGroups();
  }

  void initializeBarGroups() {
    final barGroup1 = makeGroupData(0, 5, 12);
    final barGroup2 = makeGroupData(1, 16, 12);
    final barGroup3 = makeGroupData(2, 18, 5);
    final barGroup4 = makeGroupData(3, 20, 16);
    final barGroup5 = makeGroupData(4, 17, 6);
    final barGroup6 = makeGroupData(5, 19, 1.5);
    final barGroup7 = makeGroupData(6, 10, 1.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    showingBarGroups.value = items;
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: leftBarColor,
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color: rightBarColor,
          width: width,
        ),
      ],
    );
  }

  //TODO: Redirect to the movements list page
  void handleBarTouchCallback(FlTouchEvent event, BarTouchResponse? response) {
    
  }
}