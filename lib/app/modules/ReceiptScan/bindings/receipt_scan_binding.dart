import 'package:get/get.dart';

import '../controllers/receipt_scan_controller.dart';

class ReceiptScanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReceiptScanController>(
      () => ReceiptScanController(),
    );
  }
}
