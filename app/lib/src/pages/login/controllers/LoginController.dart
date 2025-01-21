import 'package:app/src/DTO/login/LoginDTO.dart';
import 'package:app/src/services/ApiService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Logincontroller extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final Apiservice apiservice = Get.put(Apiservice());
  RxBool loginError = false.obs;
  RxBool loading = false.obs;

  //login with email and password
  void handleLogin() async {
    loading.value = true;
    final username = usernameController.text;
    final password = passwordController.text;
    final loginDTO = Logindto(username, password);
    final token = await apiservice.login(loginDTO);
    loading.value = false;

    if (token != null) {
      loginError.value = false;
      storeToken(token);
      Get.toNamed("/dashboard");
    } else {
      loginError.value = true;
    }
  }

  bool storeToken(String token) {
    final box = GetStorage();
    box.write('token', token);
    return true;
  }
}
