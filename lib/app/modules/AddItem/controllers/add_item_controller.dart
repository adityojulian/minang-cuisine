import 'dart:io';

import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pickles_rapyd/app/data/add_item_provider.dart';

class AddItemController extends GetxController {
  List<S2Choice<String>> matrialChoice = [
    S2Choice<String>(value: 'Plastic', title: 'Plastic'),
    S2Choice<String>(value: 'Metal', title: 'Metal'),
    S2Choice<String>(value: 'Cardboard', title: 'Cardboard'),
    S2Choice<String>(value: 'Glass', title: 'Glass'),
    S2Choice<String>(value: 'Wood', title: 'Wood'),
  ];

  List<S2Choice<String>> typeChoice = [
    S2Choice<String>(
        value: 'Thin Packaging',
        title: 'Thin Packaging',
        subtitle: "Bread bags, candy wrappers, medicine blister packs..."),
    S2Choice<String>(
        value: 'Bottle',
        title: 'Bottle',
        subtitle:
            "Drinks, cooking oil, spray cans, cleaning sprays, nailpolish bottles..."),
    S2Choice<String>(
        value: 'Jar',
        title: 'Jar',
        subtitle:
            "Jam, mayonnaise, olives, vitamin jars. Usually with a screw-on lid..."),
    S2Choice<String>(
        value: 'Bowl/Tray/Tub/Container',
        title: 'Bowl/Tray/Tub/Container',
        subtitle: "Dairy containers, ice cream tubs, food bowls..."),
    S2Choice<String>(
        value: 'Tube',
        title: "Tube",
        subtitle: 'Caviar, salad dressing, shampoo tubes...'),
  ];

  List<S2Choice<String>> sizeChoice = [
    S2Choice<String>(
        value: 'XS', title: 'XS', subtitle: "About the size of a matchbox"),
    S2Choice<String>(
        value: 'S', title: 'S', subtitle: "About the size of a 33cl soda can"),
    S2Choice<String>(
        value: 'M', title: 'M', subtitle: "About the size of a milk carton"),
    S2Choice<String>(
        value: 'L', title: 'L', subtitle: "About the size of a cerealbox"),
    S2Choice<String>(
        value: 'XL', title: 'XL', subtitle: "Larger than a cerealbox"),
  ];

  // Add Item Function
  void addNewItem() async {
    selectedMaterial.forEach((element) {
      sendedMaterial = sendedMaterial + element.toString();
    });
    print(sendedMaterial);
    await AddItemProvider().addNewItem(
        productNameController.text,
        "1123123",
        sendedMaterial,
        selectedType,
        double.parse(productWeightController.text),
        true);
  }

  @override
  void onInit() {
    selectedMaterial = [];
    super.onInit();
  }

  TextEditingController productNameController = TextEditingController();
  TextEditingController productWeightController = TextEditingController();

  List<String> selectedMaterial = [];
  String selectedType = "";
  String selectedSize = "";
  String sendedMaterial = "";

  void selectMaterialChoice(S2MultiSelected<String> input) {
    selectedMaterial = input.value;
    print(selectedMaterial);
    update();
  }

  void selectTypeChoice(S2SingleSelected<String> input) {
    selectedType = input.value;
    print(selectedType);
    update();
  }

  void selectSizeChoice(S2SingleSelected<String> input) {
    selectedSize = input.value;
    print(selectedSize);
    update();
  }

  // Image Picker Controller
  final ImagePicker picker = ImagePicker();
  File? imageFile;

  Future<void> getFromCamera() async {
    try {
      final XFile? pickedImage = await picker.pickImage(
        source: ImageSource.camera,
        maxHeight: 300,
        maxWidth: 300,
      );
      if (pickedImage != null) {
        imageFile = File(pickedImage.path);
        update();
      }
    } catch (e) {
      print(e);
    }
  }
}
