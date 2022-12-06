import 'package:get/get.dart';

import '../controllers/add_item_success_controller.dart';

class AddItemSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddItemSuccessController>(
      () => AddItemSuccessController(),
    );
  }
}
