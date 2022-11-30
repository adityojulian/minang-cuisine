import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BarcodeCameraController extends GetxController {
  late MobileScannerController cameraControllerBarcode;

  @override
  void onInit() {
    cameraControllerBarcode = MobileScannerController();
    // initBarcodeCamera();
    super.onInit();
  }

  @override
  void onClose() {
    print("barcode camera close");
    cameraControllerBarcode.dispose();
    // TODO: implement onClose
    super.onClose();
  }

  // @override
  // void dispose() {
  //   cameraControllerBarcode.dispose();
  //   super.dispose();
  // }

  // @override
  // void onClose() async {
  //   await cameraControllerBarcode.stop();
  //   cameraControllerBarcode.dispose();
  //   super.onClose();
  // }

  // Future<void> initBarcodeCamera() async {
  //   cameraControllerBarcode = MobileScannerController();
  // }
  // String scanBarcode = 'Unknown';

  // Future<void> scanBarcodeNormal() async {
  //   String barcodeScanRes;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
  //         '#ff6666', 'Cancel', true, ScanMode.BARCODE);
  //     print(barcodeScanRes);
  //   } on PlatformException {
  //     barcodeScanRes = 'Failed to get platform version.';
  //   }

  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
  //   // if (!mounted) return;

  //   scanBarcode = barcodeScanRes;
  //   update();
  // }
  // Future<void> startBarcodeScanStream() async {
  //   FlutterBarcodeScanner.getBarcodeStreamReceiver(
  //           '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
  //       .listen((barcode) {
  //     print(barcode);
  //     scanBarcode = barcode;
  //     update();
  //   });
  // }
  // @override
  // void onClose() {
  //   print("ke close bro");
  //   cameraController.dispose();
  //   super.onClose();
  // }

  // // #docregion AppLifecycle
  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   final CameraController? camera = cameraController;

  //   // App state changed before we got the chance to initialize.
  //   if (camera == null || !camera.value.isInitialized) {
  //     return;
  //   }

  //   if (state == AppLifecycleState.inactive) {
  //     print("kamera berenti");
  //     camera.dispose();
  //     update();
  //   }
  //   // else if (state == AppLifecycleState.resumed) {
  //   //   onNewCameraSelected(camera.description);
  //   // }
  // }
  // // #enddocregion AppLifecycle

  // @override
  // void dispose() {
  //   print("mantap ke dispose");
  //   cameraController.dispose();
  //   update();
  //   super.dispose();
  // }
}
