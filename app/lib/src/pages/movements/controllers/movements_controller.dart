import 'package:app/src/pages/movements/models/movement.dart';
import 'package:get/get.dart';
import 'package:app/src/services/ApiService.dart';
import 'package:app/src/helpers/token_helper.dart';
class MovementsController extends GetxController {
  final Apiservice apiService = Get.put(Apiservice());
  RxList<Movement> movements = RxList<Movement>([]);

  @override
  void onInit() {
    super.onInit();
    loadMovements();
  }

  void loadMovements() async {
    final String token = getToken();
    final movements = await apiService.getMovements(token);
    this.movements.value = movements;
  }

}   