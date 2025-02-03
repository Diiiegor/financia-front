import 'package:app/src/UIKit/financia_appbar.dart';
import 'package:app/src/pages/dashboard/controllers/dashboard_controller.dart';
import 'package:app/src/pages/dashboard/widgets/spendings_incomes_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/src/UIKit/shimmers/shimmer_incomes_spendings_chart.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});
  final DashboardController dashboardController =
      Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: FinanciaAppBar(title: "Dashboard", onBack: () {}),
        floatingActionButton: const FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.add_rounded),
        ),
        body: Container(
          padding:const  EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child:  SingleChildScrollView(
            child: Column(
              children: [
               // ShimmerIncomesSpendingsChart(),
                SpendingsIncomesChart(),
              ],
            ),
          ),
        ));
  }
}
