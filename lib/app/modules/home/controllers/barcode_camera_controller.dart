import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BarcodeCameraController extends GetxController {
  late MobileScannerController cameraControllerBarcode;

  @override
  void onInit() {
    cameraControllerBarcode = MobileScannerController();
    super.onInit();
  }

  @override
  void onClose() {
    cameraControllerBarcode.dispose();
    super.onClose();
  }
}
