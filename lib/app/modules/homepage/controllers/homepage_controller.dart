import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomepageController extends GetxController {
  TextEditingController pointController = TextEditingController(text: "1");
  TextEditingController gbpController = TextEditingController(text: "1");

  @override
  void onClose() {
    pointController.dispose();
    gbpController.dispose();
    super.onClose();
  }
}
