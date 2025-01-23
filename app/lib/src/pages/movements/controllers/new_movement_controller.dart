import 'dart:ffi';

import 'package:app/src/DTO/CategoryDTO.dart';
import 'package:app/src/services/ApiService.dart';
import 'package:get/get.dart';
import 'package:app/src/helpers/token_helper.dart';
import 'package:app/src/UIKit/financia_colors.dart';
import 'package:flutter/material.dart';
import 'package:app/src/DTO/store_movement_dto.dart';


class NewMovementController extends GetxController{
  final Apiservice apiService = Get.put(Apiservice());
  final categories = RxList<CategoryDTO>();
  final loadingCategories = RxBool(false);
  final selectedCategory = RxInt(0);
  final isCategorySelectorOpen = RxBool(false);
  final type = RxString('income');
  final TextEditingController amountController = TextEditingController();
  final loadingStoreMovement = RxBool(false);


  void loadCategories() async {
    loadingCategories.value = true;
    final token = getToken();
    final response = await apiService.getCategories(token);
    categories.value = response;
    loadingCategories.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    loadCategories();
  }

  void setSelectedCategory(int categoryId) {
    selectedCategory.value = categoryId;
  }

  void toggleCategorySelector() {
    isCategorySelectorOpen.value = !isCategorySelectorOpen.value;
  }

  Color getSelectedColor(){
    if(type.value == 'income'){
      return FinanciaColors.buttonSecondary.color;
    }else{
      return FinanciaColors.buttonPrimary.color;
    }
  }

  Icon getSelectedIcon(){
    if(type.value == 'income'){
      return Icon(Icons.arrow_circle_up_outlined,color: FinanciaColors.buttonSecondary.color,size: 30,);
    }else{
      return Icon(Icons.arrow_circle_down_outlined,color: FinanciaColors.buttonPrimary.color,size: 30,);
    }
  }

  void handleStoreMovement() async {
    String amount = amountController.text;

    if(amount=='' || amount.isEmpty){
      Get.snackbar("Error", "Por favor ingrese el valor del movimiento financiero");
      return;
    }

    if(selectedCategory.value ==0){
      Get.snackbar("Error", "Por favor seleccione una de las categorias disponibles");
      return;
    }

    double movementAmount = getAmount();
    
    StoreMovementDto storeMovementDto = StoreMovementDto(
      concept: "--",
      description: "--",
      amount: movementAmount,
      movementTypeId: type.value == 'income' ? 1 : 2,
      categoryId: selectedCategory.value,
    );

    loadingStoreMovement.value = true;
    
    try{
      final token = getToken();
      final response = await apiService.storeMovement(token, storeMovementDto);
      Get.offAndToNamed('/movements');
    }catch(e){
      print(e);
    }

    loadingStoreMovement.value = false;
  }

  double getAmount() {
    String amount = amountController.text;
    // Remove currency symbol, commas and any whitespace
    String cleanAmount = amount.replaceAll(RegExp(r'[^\d.]'), '');
    return double.parse(cleanAmount);
  }
}