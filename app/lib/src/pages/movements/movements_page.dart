import 'package:app/src/pages/movements/components/movement_item.dart';
import 'package:app/src/UIKit/financia_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './controllers/movements_controller.dart';

class MovementsPage extends StatelessWidget {
  MovementsPage({super.key});
  final MovementsController controller = Get.put(MovementsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FinanciaAppBar(title: "Movimientos", onBack: (){Get.back();}),
      body:  Container(
        padding:const  EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Obx(() => ListView.builder(
          itemCount: controller.movements.length,
          itemBuilder: (context, index) => MovementItem(movement: controller.movements[index]),
        ))
      ),
    );
  }
}
