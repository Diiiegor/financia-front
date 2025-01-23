import 'package:app/src/UIKit/financia_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/src/pages/movements/controllers/category_selector_controller.dart';
import 'package:app/src/pages/movements/controllers/new_movement_controller.dart';


class CategoryItem extends StatelessWidget {
  CategoryItem({super.key,required this.icon,required this.name,required this.onPressed,required this.id});

  final CategorySelectorController categorySelectorController = Get.find<CategorySelectorController>();
  final NewMovementController newMovementController = Get.find<NewMovementController>();
  final String icon;
  final String name;
  final Function() onPressed;
  final int id;
   




  @override
  Widget build(BuildContext context) {
    return Obx(() => ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: categorySelectorController.categorySelected.value == id ? newMovementController.getSelectedColor() : FinanciaColors.bgSecondary.color,
        minimumSize: const Size(10, 10),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: (){
        onPressed();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            icon,
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 12,color: Colors.white),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    ));
  }
}