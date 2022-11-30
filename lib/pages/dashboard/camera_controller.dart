import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class CameraControllerGetx extends GetxController {
  // final List<Tab> homeTabs = <Tab>[
  //   Tab(
  //     text: "Barcode",
  //   ),
  //   Tab(
  //     text: "Receipt",
  //   )
  // ];

  // late TabController homeTabController;

  // MobileScannerController cameraControllerBarcode = MobileScannerController();
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
  late CameraController cameraController;
  late Future<void> initController;
  bool isCameraReady = false;
  late XFile imageFile;

  @override
  void onInit() async {
    super.onInit();
    print("ke init bro");
    Get.delete<CameraController>();
    // homeTabController = TabController(length: homeTabs.length, vsync: this);
    await initCamera();
    print("iscamera: " + isCameraReady.toString());
  }

  @override
  void onClose() async {
    print("ke close bro");
    await disposeCamera();
    // isCameraReady = false;
    // update();
    // isCameraReady == false;
    // cameraController.dispose();
    super.onClose();
  }

  // void onResumed() {
  //   print('HomeController - onResumed called');
  //   initCamera();
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

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    cameraController = CameraController(
      firstCamera,
      ResolutionPreset.high,
    );
    await cameraController.initialize().then((_) {
      isCameraReady = true;
      update();
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('User denied camera access.');
            break;
          default:
            print('Handle other errors.');
            break;
        }
      }
    });
  }

  Future<void> disposeCamera() async {
    await cameraController.dispose();
    isCameraReady = false;
    print("iscamera: " + isCameraReady.toString());
    update();
  }
}
