import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/category_controller.dart';
import 'package:app/src/widgets/FilledTextField.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
class NewCategoryPage extends StatelessWidget {
  final CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledTextField(controller: categoryController.nameController, hintText: "Nombre de la categoría"),
            const SizedBox(height: 12),
            FilledTextField(controller: categoryController.descriptionController, hintText: "Descripción de la categoría", maxLines: 3),
            const SizedBox(height: 12),
            Column(
              children: [
                Obx(() => categoryController.showEmojiPicker.value ?
            EmojiPicker(
              onEmojiSelected: (category, emoji) {
                categoryController.emoji.value = emoji.emoji;
                categoryController.showEmojiPicker.value = false;
              },
                ) : const SizedBox()),
                Obx(() => categoryController.emoji.value != "" ? Text(categoryController.emoji.value) : const SizedBox()),
                ElevatedButton(onPressed: () {
                  categoryController.showEmojiPicker.value = !categoryController.showEmojiPicker.value;
                }, child: const Text("Seleccionar emoji"))
              ],
            ),
            ElevatedButton(onPressed: categoryController.storeCategory, child: const Text("Crear"))
          ],
        )
      )
    );
  }
}
