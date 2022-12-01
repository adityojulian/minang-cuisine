import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomepageController extends GetxController {
  int initialPoint = 1;

  late TextEditingController pointController;
  late TextEditingController gbpController;

  @override
  void onInit() {
    pointController = TextEditingController(text: initialPoint.toString());
    gbpController = TextEditingController(
        text: (int.parse(pointController.text) * 0.01).toString());
    // TODO: implement onInit
    super.onInit();
  }

  convertPointToGBP(String value) {
    gbpController.text = (int.parse(value) * 0.01).toString();
  }

  convertGBPtoPoint(String value) {
    pointController.text = (int.parse(value) * 100).toString();
  }

  @override
  void onClose() {
    pointController.dispose();
    gbpController.dispose();
    super.onClose();
  }
}
