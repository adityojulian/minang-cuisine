import 'package:get/get.dart';

import '../controllers/recycle_success_controller.dart';

class RecycleSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecycleSuccessController>(
      () => RecycleSuccessController(),
    );
  }
}
