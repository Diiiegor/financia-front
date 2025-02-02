import 'package:app/src/UIKit/financia_button.dart';
import 'package:flutter/material.dart';
import 'package:app/src/UIKit/financia_colors.dart';
import 'package:get/get.dart';
import 'package:app/src/pages/categories/controllers/category_controller.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class NewCategoryModal extends StatelessWidget {
  NewCategoryModal({super.key});
  final CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      alignment: Alignment.center,
      contentPadding: const EdgeInsets.all(20),
      backgroundColor: FinanciaColors.bgSecondary.color,
      title: const Text('Crear nueva categoria',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
      children:  [
        TextField(
          controller: categoryController.nameController,
          style:  const TextStyle(color: Colors.white),
              decoration:  InputDecoration(
                hintText: 'Nombre',
                hintStyle: const TextStyle(color: Colors.white, fontSize: 16),
                suffixIcon: TextButton(
                  child:Obx(()=> categoryController.emoji.value.isEmpty ? Icon(Icons.emoji_emotions_outlined,color: FinanciaColors.buttonSecondary.color,) :
                  Text(categoryController.emoji.value,style: const TextStyle(fontSize: 16),)),
                  onPressed: () {
                    categoryController.showEmojiPicker.value = !categoryController.showEmojiPicker.value;
                },),
              ),
            ),
        const SizedBox(height: 16),
        Column(
          children: [
            const SizedBox(height: 10,),
            SizedBox(width: 600,
          child: Obx(() => categoryController.showEmojiPicker.value ? EmojiPicker(
                config: Config(
                  emojiViewConfig:  EmojiViewConfig(
                    backgroundColor: FinanciaColors.bgSecondary.color,
                    emojiSizeMax:20
                  ),
                  categoryViewConfig: CategoryViewConfig(
                    backgroundColor: FinanciaColors.bgSecondary.color,
                    indicatorColor: FinanciaColors.buttonSecondary.color,
                    iconColorSelected: FinanciaColors.buttonSecondary.color,
                  ),
                  bottomActionBarConfig: const BottomActionBarConfig(
                    enabled: false
                  ),
                ),
                onEmojiSelected: (category, emoji) {
                  categoryController.emoji.value = emoji.emoji;
                },
              ) : const SizedBox()),
        ),
            FinanciaButton(
              text: "Guardar", 
              onPressed: () {
                categoryController.storeCategory();
              },
            ),
          ],
        ),
      ],
    );
  }
}