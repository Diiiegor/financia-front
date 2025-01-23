import 'package:app/src/pages/movements/components/category_selector.dart';
import 'package:app/src/pages/movements/controllers/new_movement_controller.dart';
import 'package:app/src/utils/currency_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:app/src/UIKit/financia_button.dart';
import 'package:app/src/UIKit/financia_colors.dart';
import 'package:app/src/utils/currency_input_formatter.dart';


class NewMovementPage extends StatelessWidget {
  NewMovementPage({super.key});
  final NewMovementController newMovementController = Get.put(NewMovementController());

  
  @override
  Widget build(BuildContext context) {
  final screenSize = MediaQuery.of(context).size;
  final width = screenSize.width;
  final buttonWidth = width * 0.4;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: FinanciaColors.mainBg.color,
        elevation: 0,
        flexibleSpace: Container(
          color: FinanciaColors.mainBg.color,
        ),
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white,),
        ),
        title: const Text('Nuevo movimiento financiero', style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: const Text('Tipo de movimiento', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)),
              const SizedBox(height: 10,),
               Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FinanciaButton(text: 'Ingreso', onPressed: (){newMovementController.type.value = 'income';},size:  Size(buttonWidth, 40),color: newMovementController.type.value == 'income' ? FinanciaColors.buttonSecondary : FinanciaColors.buttonSecondaryDisabled,),
                  const SizedBox(width: 10,),
                  FinanciaButton(text: 'Gasto', onPressed: (){newMovementController.type.value = 'expense';},color: newMovementController.type.value == 'expense' ? FinanciaColors.buttonPrimary : FinanciaColors.buttonPrimaryDisabled,size:  Size(buttonWidth, 40),),
                ],
              ),),
              const SizedBox(height: 30,),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child:  Obx(() => TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  style:  const TextStyle(color: Colors.white,fontSize: 20),
                  controller: newMovementController.amountController,
                  decoration:  InputDecoration(
                    hintText: '0.00',
                    label: const Text('Monto', style: TextStyle(color: Colors.white,fontSize: 16),),
                    suffixIcon: newMovementController.getSelectedIcon(),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CurrencyInputFormatter()
                  ],
                ),),
              ),
              const SizedBox(height: 30,),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: const Text('Categoria', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
              ),
              const SizedBox(height: 10,),
              CategorySelector(),
              const SizedBox(height: 30,),
              Obx(() => FinanciaButton(text: 'Guardar', onPressed: newMovementController.handleStoreMovement,size: Size(buttonWidth, 40),color: FinanciaColors.buttonPrimary,loading: newMovementController.loadingStoreMovement.value,),),
            ],
          ),
        ),
      ),
    );
  }
}