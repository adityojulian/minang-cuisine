import 'package:get/get.dart';

import '../controllers/add_to_inventory_success_controller.dart';

class AddToInventorySuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddToInventorySuccessController>(
      () => AddToInventorySuccessController(),
    );
  }
}
