import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickles_rapyd/main.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen>
    with WidgetsBindingObserver {
  CameraController? controller;
  bool _isCameraInitialized = false;
  // TabController? homeTabController;

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    final previousCameraController = controller;

    // Initialize the camera controller
    final CameraController cameraController = CameraController(
        cameraDescription, ResolutionPreset.high,
        imageFormatGroup: ImageFormatGroup.jpeg);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isCameraInitialized
          ? SizedBox(
              width: Get.width,
              height: Get.height - AppBar().preferredSize.height,
              child: controller!.buildPreview(),
            )
          : Container(),
    );
  }
}
