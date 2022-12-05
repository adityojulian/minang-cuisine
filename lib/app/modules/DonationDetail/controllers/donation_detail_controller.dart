import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickles_rapyd/app/models/DonationModel.dart';

class DonationDetailController extends GetxController {
  final DonationModel donation = Get.arguments;
  TextEditingController donationAmount = TextEditingController();
}
