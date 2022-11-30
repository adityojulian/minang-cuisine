import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BarcodeCameraScreen extends StatefulWidget {
  BarcodeCameraScreen({Key? key}) : super(key: key);

  @override
  State<BarcodeCameraScreen> createState() => _BarcodeCameraScreenState();
}

class _BarcodeCameraScreenState extends State<BarcodeCameraScreen>
    with WidgetsBindingObserver {
  // Init
  MobileScannerController? controller;

  void onNewCameraSelected() async {
    final previousCameraController = controller;

    // Initialize camera
    final MobileScannerController cameraController = MobileScannerController();

    // Dispose previous camera
    await previousCameraController?.stop();
    previousCameraController?.dispose();

    // Replace with new controller
    if (mounted) {
      setState(() {
        controller = cameraController;
      });
    }
  }

  @override
  void initState() {
    onNewCameraSelected();
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final MobileScannerController? cameraController = controller;

    if (cameraController == null) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      onNewCameraSelected();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height - AppBar().preferredSize.height,
        child: MobileScanner(
            // controller: controller,
            allowDuplicates: false,
            onDetect: (barcode, args) {
              if (barcode.rawValue == null) {
                debugPrint('Failed to scan Barcode');
              } else {
                final String code = barcode.rawValue!;
                debugPrint('Barcode found! $code');
              }
            }),
      ),
    );
  }
}
