import 'package:app/src/DTO/CategoryDTO.dart';
import 'package:app/src/services/ApiService.dart';
import 'package:get/get.dart';
import 'package:app/src/helpers/token_helper.dart';

class NewMovementController extends GetxController{
  final Apiservice apiService = Get.put(Apiservice());
  final categories = RxList<CategoryDTO>();
  final loadingCategories = RxBool(false);
  final selectedCategory = RxInt(1);
  final isCategorySelectorOpen = RxBool(false);
  
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
}