import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/src/pages/movements/controllers/new_movement_controller.dart';
import 'package:app/src/pages/movements/components/category_item.dart';
import 'package:app/src/pages/movements/controllers/category_selector_controller.dart';
class CategorySelector extends StatelessWidget {
  final newMovementController = Get.find<NewMovementController>();
  final categorySelectorController = Get.put(CategorySelectorController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      child: Obx(() => GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.1,
            ),
            itemCount: newMovementController.categories.value.length,
            itemBuilder: (context, index) {
              return CategoryItem(
                id: newMovementController.categories.value[index].id ?? 0,
                icon: newMovementController.categories.value[index].icon, 
                name: newMovementController.categories.value[index].name,
                onPressed: (){
                  categorySelectorController.categorySelected.value = newMovementController.categories.value[index].id ?? 0;
                },
              );
            },
          ),
    ));
  }
}
