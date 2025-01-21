import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LogoutService{
  static Future<void> logout() async {
    await GetStorage().remove('token');
    Get.offAllNamed('/login');
  }
}
