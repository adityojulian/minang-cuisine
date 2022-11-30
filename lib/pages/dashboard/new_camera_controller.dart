import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NewCameraController extends FullLifeCycleController {
  late List<CameraDescription> cameras;
  late CameraController cameraCon;
  late Future<void> initController;
  bool isCameraReady = false;

  Future<void> getAvailableCameras() async {
    print("available camera");
    cameras = await availableCameras();
  }

  Future<void> initCam() async {
    await cameraCon.dispose();
    print("masuk init camera ges");
    cameraCon = CameraController(cameras[0], ResolutionPreset.high);
    initController = cameraCon.initialize().then((_) {
      isCameraReady = true;
      update();
    }).catchError((Object e) {
      // print("errorr banggg");
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

  @override
  void onInit() {
    print("masuk on init");
    getAvailableCameras();
    // cameraCon = CameraController(cameras[0], ResolutionPreset.high);
    // initController = cameraCon.initialize();
    initCam();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onDetached() {
    print('HomeController - onDetached called');
  }

  // Mandatory
  @override
  void onInactive() {
    print('HomeController - onInative called');
    // cameraCon.dispose();
  }

  // Mandatory
  @override
  void onPaused() {
    print('HomeController - onPaused called');
  }

  // Mandatory
  @override
  void onResumed() {
    print('HomeController - onResumed called');
    initCam();
  }
}
