import 'package:get/get.dart';

import '../controllers/setup_payment_controller.dart';

class SetupPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetupPaymentController>(
      () => SetupPaymentController(),
    );
  }
}
