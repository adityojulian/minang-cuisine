import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddItemController extends GetxController {
  TextEditingController productNameController = TextEditingController();

  List<String> selected = [];

  List<S2Choice<String>> matrialChoice = [
    S2Choice<String>(value: 'mon', title: 'Plastic'),
    S2Choice<String>(value: 'tue', title: 'Metal'),
    S2Choice<String>(value: 'wed', title: 'Cardboard'),
    S2Choice<String>(value: 'thu', title: 'Glass'),
    S2Choice<String>(value: 'fri', title: 'Wood'),
  ];
  List<String> materialChoice = ["Plastic", "Metal", "Cardboard", "Glass"];

  void selectMaterialChoice(S2MultiSelected<String> input) {
    selected = input.value;
    update();
  }
}
