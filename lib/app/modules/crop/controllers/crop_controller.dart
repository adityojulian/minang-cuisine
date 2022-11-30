import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';

class CropController extends GetxController {
  XFile? pickedFile;
  CroppedFile? croppedFile;
  String? scannedText;
  bool textScanning = false;

  // Crop function
  Future<void> cropImage(String imageSource) async {
    final cropImageFile = await ImageCropper().cropImage(
      sourcePath: imageSource,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
      ],
    );
    if (cropImageFile != null) {
      // croppedFile = cropImageFile;
      scanImage(cropImageFile.path);
    }
  }

  Future<void> scanImage(String imageSource) async {
    textScanning = true;

    final inputImage = InputImage.fromFilePath(imageSource);
    final textDetector = GoogleMlKit.vision.textRecognizer();
    RecognizedText recognizedText = await textDetector.processImage(inputImage);
    await textDetector.close();

    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        scannedText = scannedText! + line.text + "\n";
      }
    }
    print("scannedText: " + scannedText!);
    textScanning = false;
    update();
  }
}
