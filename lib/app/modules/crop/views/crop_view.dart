import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/crop_controller.dart';

class CropView extends GetView<CropController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Crop Image")),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Expanded(child: _body())],
      ),
    );
  }

  Widget _body() {
    print("get argument bang: " + Get.arguments);
    if (Get.arguments != null) {
      return _imageCard();
    } else {
      return Container();
    }
  }

  Widget _imageCard() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: _image(),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          _menu(),
        ],
      ),
    );
  }

  Widget _image() {
    final screenWidth = Get.width;
    final screenHeigth = Get.height - AppBar().preferredSize.height;

    if (Get.arguments != null) {
      final path = Get.arguments;
      return ConstrainedBox(
        constraints: BoxConstraints(
            maxHeight: 0.7 * screenHeigth, maxWidth: 0.8 * screenWidth),
        child: Image.file(File(path)),
      );
      // } else if (controller.croppedFile != null) {
      //   final path = controller.croppedFile!.path;
      //   return ConstrainedBox(
      //     constraints: BoxConstraints(
      //         maxHeight: 0.7 * screenHeigth, maxWidth: 0.8 * screenWidth),
      //     child: Image.file(
      //       File(path),
      //     ),
      //   );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _menu() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(onPressed: () {}),
        if (controller.croppedFile == null)
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: FloatingActionButton(
              onPressed: () {
                controller.cropImage(Get.arguments);
              },
              backgroundColor: const Color(0xFFBC764A),
              tooltip: "Crop",
              child: const Icon(Icons.crop),
            ),
          )
      ],
    );
  }
}
