import 'package:app/src/DTO/CategoryDTO.dart';
import 'package:app/src/services/ApiService.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:app/src/helpers/token_helper.dart';

class CategoryController extends GetxController {
  final Apiservice apiService = Get.put(Apiservice());
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final emojiController = TextEditingController();
  final emoji = RxString("");
  final showEmojiPicker = RxBool(false);
  final isLoading = RxBool(false);

  Future<dynamic> storeCategory() async {
    try {
      if (nameController.text == null || nameController.text == "") {
        throw Exception("El nombre de la categoría es requerido");
      }
      if (emoji.value == null || emoji.value == "") {
        throw Exception("El emoji de la categoría es requerido");
      }

      isLoading.value = true;
      final token = getToken();
      final storeCategoryDTO = CategoryDTO(
          name: nameController.text,
          icon: emoji.value,
          description: descriptionController.text);
      final response = await apiService.storeCategory(token, storeCategoryDTO);
      isLoading.value = false;
      if (response != null) {
        Get.snackbar(
          "Categoría creada", 
          "La categoría se ha creado correctamente",
          colorText: Colors.green,
          snackPosition: SnackPosition.TOP
        );
        await Future.delayed(Duration(milliseconds: 500));
        Navigator.of(Get.context!).pop();
      } else {
        throw Exception("No se pudo crear la categoría");
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", e.toString(),colorText: Colors.red,snackPosition: SnackPosition.BOTTOM);
    }
  }
}
