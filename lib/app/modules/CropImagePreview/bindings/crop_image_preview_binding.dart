import 'package:get/get.dart';

import '../controllers/crop_image_preview_controller.dart';

class CropImagePreviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CropImagePreviewController>(
      () => CropImagePreviewController(),
    );
  }
}
