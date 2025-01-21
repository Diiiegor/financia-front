import 'package:app/src/pages/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  final DashboardController dashboardController =
      Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: const FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.add_rounded),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: dashboardController.handleClickMovements,
                  style: const ButtonStyle(
                      backgroundColor: const WidgetStatePropertyAll(
                          Color.fromRGBO(65, 116, 217, 1)),
                      minimumSize: const WidgetStatePropertyAll(
                          Size(double.infinity, 50)),
                      ),
                  child: const Text("Ver lista de movimientos")),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: dashboardController.handleClickNewCategory,
                  style: const ButtonStyle(
                      backgroundColor:  WidgetStatePropertyAll(
                          Color.fromRGBO(65, 116, 217, 1)),
                      minimumSize:  WidgetStatePropertyAll(Size(double.infinity, 50))),
                  child: const Text("Crear nueva categoria")),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: dashboardController.handleClickNewMovement,
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          Color.fromRGBO(65, 116, 217, 1)),
                      minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50))),
                  child: const Text("Crear nuevo movimiento")),
            ],
          ),
        ));
  }
}
