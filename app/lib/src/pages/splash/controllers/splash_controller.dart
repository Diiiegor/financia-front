import 'package:app/src/services/ApiService.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  final Apiservice apiservice = Get.put(Apiservice());

  @override
  void onReady() {
    super.onReady();
    _validateToken();
  }

  _validateToken() async {
    final box = GetStorage();
    final String? token = box.read('token');

    if (token != null) {
      //navigate to dashboard
      final bool validToken = await apiservice.validateToken(token);
      if (validToken) {
        Get.offNamed("/dashboard");
        return;
      }
    }

    //go to login
    Get.offNamed("/login");
  }
}
