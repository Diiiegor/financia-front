import 'package:app/src/pages/login/controllers/LoginController.dart';
import 'package:app/src/pages/login/components/emailLogin.dart';
import 'package:app/src/pages/login/components/network_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


class Loginpage extends StatelessWidget {
  final Logincontroller logincontroller = Get.put(Logincontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              color: Color(0xFF1D1F27),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
              width: double.infinity,
              height: context.mediaQuery.size.height*0.47,
              child: 
               Column(
                children: [
                  const SizedBox(height: 20,),
                  const Text('Continuar con',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 20,),
                  NetworkLogin(),
                  const SizedBox(height: 20,),
                  const Divider(color: Color.fromARGB(255, 134, 126, 126),),
                  Emaillogin(),
                ],
              ),
            ),
        )),
    );
  }
}
