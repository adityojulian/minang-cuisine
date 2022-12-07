import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickles_rapyd/app/models/DonationModel.dart';
import 'package:pickles_rapyd/app/data/donation_provider.dart';
import 'package:pickles_rapyd/app/data/disbures_provider.dart';

class DonationDetailController extends GetxController {
  final DonationModel donation = Get.arguments;
  TextEditingController donationAmount = TextEditingController();

  Future<void> donate() async {
    await DonationProvider().donate(
        donationAmount.text,
        donation.firstName.toString(),
        donation.lastName.toString(),
        donation.accountNumber.toString(),
        donation.sortCode.toString());
    update();
  }
}
