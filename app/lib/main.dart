import 'package:app/src/pages/dashboard/dashboard_page.dart';
import 'package:app/src/pages/login/loginPage.dart';
import 'package:app/src/pages/movements/movements_page.dart';
import 'package:app/src/pages/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:app/src/pages/movements/new_movement_page.dart';
void main() async {

  final pages = [
    GetPage(name: '/login', page: () => Loginpage()),
    GetPage(name: '/dashboard', page: () => DashboardPage()),
    GetPage(name: '/movements', page: ()=>MovementsPage()),
    GetPage(name: '/new-movement', page: ()=>NewMovementPage())
  ];

  await GetStorage.init();
  runApp(GetMaterialApp(
    home: Home(),
    getPages: pages,
    debugShowCheckedModeBanner: false,
    theme:
        ThemeData(scaffoldBackgroundColor: const Color(0xFF15171C)),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(context) {
    return Scaffold(
      body: Splash(),
    );
  }
}
