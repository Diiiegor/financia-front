import 'package:get/get.dart';
import 'package:app/src/widgets/new_category_modal.dart';
import 'package:app/src/pages/categories/controllers/category_controller.dart';
class DashboardController extends GetxController {
  void handleClickMovements() {
    Get.toNamed('/movements');
  }

  void handleClickNewCategory() {
    Get.delete<CategoryController>();
    Get.dialog(NewCategoryModal());
  }

  void handleClickNewMovement() {
    Get.toNamed('/new-movement');
  }
  
}
