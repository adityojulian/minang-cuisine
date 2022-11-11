import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CameraControllerGetx extends GetxController {
  late CameraController cameraController;
  late Future<void> _initController;
  var isCameraReady = false;
  late XFile imageFile;

  @override
  void onInit() {
    print("ke init bro");
    initCamera();
    super.onInit();
  }

  @override
  void onClose() {
    print("ke close bro");
    cameraController.dispose();
    update();
    super.onClose();
  }

  // #docregion AppLifecycle
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? camera = cameraController;

    // App state changed before we got the chance to initialize.
    if (camera == null || !camera.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      print("kamera berenti");
      camera.dispose();
      update();
    }
    // else if (state == AppLifecycleState.resumed) {
    //   onNewCameraSelected(camera.description);
    // }
  }
  // #enddocregion AppLifecycle

  @override
  void dispose() {
    print("mantap ke dispose");
    cameraController.dispose();
    update();
    super.dispose();
  }

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    cameraController = CameraController(firstCamera, ResolutionPreset.high);
    _initController = cameraController.initialize().then((_) {
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
    update();
  }
}
