import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool showStatus = true;
  bool checkBoxStatus = false;

  void toggleShow() {
    showStatus = !showStatus;
    update();
  }

  void toggleCheckbox(bool input) {
    checkBoxStatus = input;
    update();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.onClose();
  }
}
