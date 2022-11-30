import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pickles_rapyd/app/controllers/auth_controller.dart';
import 'package:pickles_rapyd/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final authCon = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Log In',
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.w600),
        ),
        actions: [
          TextButton(
              onPressed: () => Get.toNamed(Routes.REGISTER),
              child: Text(
                "Register",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ))
        ],
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: controller.emailController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                ),
                filled: true,
                fillColor: Color.fromRGBO(232, 232, 232, 1),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: "Email",
                labelStyle: TextStyle(color: Colors.grey.shade500),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GetBuilder<LoginController>(
                builder: (c) {
                  return TextFormField(
                    controller: c.passwordController,
                    obscureText: c.showStatus,
                    decoration: InputDecoration(
                      suffixIcon: TextButton(
                          onPressed: () => controller.toggleShow(),
                          child: Text(
                            "Show",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.green),
                          )),
                      enabledBorder: OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0),
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(232, 232, 232, 1),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.grey.shade500),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 53,
              child: ElevatedButton(
                onPressed: () => authCon.signin(controller.emailController.text,
                    controller.passwordController.text),
                child: Text(
                  "Log In",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(76, 168, 98, 0.8),
                  fixedSize: const Size(152, 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 53,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot your password?",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(76, 168, 98, 0.8)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
