import 'package:get/get.dart';

class TestPageController extends GetxController {
  bool status = true;

  void toggleShow() {
    status = !status;
    update();
  }
}
