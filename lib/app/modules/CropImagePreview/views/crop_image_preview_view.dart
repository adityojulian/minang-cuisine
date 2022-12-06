import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/crop_image_preview_controller.dart';

class CropImagePreviewView extends GetView<CropImagePreviewController> {
  const CropImagePreviewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CropImagePreviewView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 300,
              child: Image.file(
                File(Get.arguments),
                fit: BoxFit.cover,
              ),
            ),
          ),
          GetBuilder<CropImagePreviewController>(
            builder: (c) {
              return Text(c.scannedText);
            },
          )
        ],
      ),
    );
  }
}
