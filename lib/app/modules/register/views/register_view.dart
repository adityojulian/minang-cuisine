import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pickles_rapyd/app/controllers/auth_controller.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final authCon = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Sign Up',
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.w600),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: TextButton(
                  onPressed: () => Get.back(),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  )))
        ],
        iconTheme: IconThemeData(color: Colors.black),
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
              controller: controller.nameController,
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
                labelText: "Name",
                labelStyle: TextStyle(color: Colors.grey.shade500),
              ),
            ),
            const SizedBox(height: 16),
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
            GetBuilder<RegisterController>(
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
            SizedBox(height: 16),
            Expanded(
              child: GetBuilder<RegisterController>(
                builder: (c) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            side: MaterialStateBorderSide.resolveWith(
                              (states) => BorderSide(
                                width: 1.0,
                                color: Colors.grey,
                              ),
                            ),
                            activeColor: Colors.green,
                            value: c.checkBoxStatus,
                            onChanged: (newValue) =>
                                c.toggleCheckbox(newValue!)),
                      ),
                      Flexible(
                        // fit: FlexFit.loose,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 3),
                          child: Text(
                            "I would like to receive your newsletter and other promotional information.",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 53,
              child: ElevatedButton(
                onPressed: () => authCon.signup(
                    controller.nameController.text,
                    controller.emailController.text,
                    controller.passwordController.text),
                child: Text(
                  "Sign Up",
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
