import 'package:app/src/pages/login/controllers/LoginController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Emaillogin extends StatelessWidget {
  final Logincontroller _logincontroller = Get.put(Logincontroller());
  
  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: "Correo",
                  hintStyle: TextStyle(color: Colors.white),
                ),
                controller: _logincontroller.usernameController,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 15),
              TextField(
                decoration: const InputDecoration(
                  hintText: "Contraseña",
                  hintStyle: TextStyle(color: Colors.white),
                ),
                controller: _logincontroller.passwordController,
                style: const TextStyle(color: Colors.white),
                obscureText: true,
              ),
              const SizedBox(
                height: 15,
              ),
              Obx(() => ElevatedButton(
                  onPressed: _logincontroller.loading.value
                      ? null
                      : _logincontroller.handleLogin,
                  style: ButtonStyle(
                      backgroundColor: const WidgetStatePropertyAll(
                          Color.fromRGBO(65, 116, 217, 1)),
                      minimumSize: const WidgetStatePropertyAll(
                          Size(double.infinity, 50)),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)))),
                  child: _logincontroller.loading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const Text(
                          "Iniciar sesión",
                          style: TextStyle(color: Colors.white),
                        ))),
              Obx(() => _logincontroller.loginError.value
                  ? const Text("Error")
                  : Container())
            ],
          ),
        );
  }
}
