import 'package:app/src/pages/splash/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash  extends StatelessWidget{
  final SplashController splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}