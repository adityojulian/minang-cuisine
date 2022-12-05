import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickles_rapyd/app/modules/crop/controllers/crop_controller.dart';
import 'package:pickles_rapyd/app/modules/crop/views/crop_view.dart';
import 'package:pickles_rapyd/app/routes/app_pages.dart';
import 'package:pickles_rapyd/main.dart';

class CameraScreen extends StatefulWidget {
  CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen>
    with WidgetsBindingObserver {
  CameraController? controller;
  bool _isCameraInitialized = false;
  XFile? imageFile;
  // TabController? homeTabController;

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    final previousCameraController = controller;

    // Initialize the camera controller
    final CameraController cameraController = CameraController(
        cameraDescription, ResolutionPreset.high,
        imageFormatGroup: ImageFormatGroup.jpeg);

    // Turn off flash
    cameraController.setFlashMode(FlashMode.off);

    // Dispose previous camera controller
    await previousCameraController?.dispose();

    // Replace with new controller
    if (mounted) {
      setState(() {
        controller = cameraController;
      });
    }

    // Update UI if controller updated
    cameraController.addListener(() {
      if (mounted) setState(() {});
    });

    // Initialize Controller
    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      print("Error initializing camera: $e");
    }

    // Update boolean status
    if (mounted) {
      setState(() {
        _isCameraInitialized = controller!.value.isInitialized;
      });
    }
  }

  @override
  void initState() {
    print("available camera " + cameras.toString());
    onNewCameraSelected(cameras[0]);
    // homeTabController = TabController(length: homeTabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    // homeTabController?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller;

    // App state changed before initialization
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      // Dispose for memory
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      // Reinitialize camera with same properties
      onNewCameraSelected(cameraController.description);
    }

    super.didChangeAppLifecycleState(state);
  }

  Future<XFile?> captureImage() async {
    print("masuk take picture");

    final CameraController? cameraController = controller;

    if (cameraController == null || !cameraController.value.isInitialized) {
      Get.snackbar("Error", "Camera is not ready");
    }

    if (cameraController!.value.isTakingPicture) {
      print("masuk taking picture");
      return null;
    }

    try {
      XFile file = await cameraController.takePicture();
      return file;
      // Get.toNamed(Routes.CROP, arguments: file.path);
    } on CameraException catch (e) {
      debugPrint("ErrorCamera $e");
      return null;
    }

    // await cameraController.takePicture().then((file) {
    //   print("masuk ambil gambar");
    //   setState(() {
    //     imageFile = file;
    //   });
    //   if (mounted) {
    //     print("imageFile: " + imageFile!.path);
    //     Get.toNamed(Routes.CROP, arguments: imageFile!.path);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _isCameraInitialized
              ? SizedBox(
                  width: Get.width,
                  height: Get.height - AppBar().preferredSize.height,
                  child: controller!.buildPreview(),
                )
              : Container(),
          GetBuilder<CropController>(
            init: CropController(),
            // initState: (_) {},
            builder: (cropController) {
              return InkWell(
                onTap: () async {
                  XFile? rawImage = await captureImage();
                  cropController.cropImage(rawImage!.path);
                  // await takePicture();
                  // captureImage();
                  // File imageFile = File(rawImage!.path);
                  // Get.toNamed(Routes.CROP, arguments: rawImage!.path);
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(Icons.circle, color: Colors.white38, size: 80),
                    Icon(Icons.circle, color: Colors.white, size: 65),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
    ;
  }
}
