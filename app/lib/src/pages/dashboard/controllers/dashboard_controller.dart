import 'package:get/get.dart';

class DashboardController extends GetxController {
  void handleClickMovements() {
    Get.toNamed('/movements');
  }

  void handleClickNewCategory() {
    Get.toNamed('/new-category');
  }

  void handleClickNewMovement() {
    Get.toNamed('/new-movement');
  }
}
