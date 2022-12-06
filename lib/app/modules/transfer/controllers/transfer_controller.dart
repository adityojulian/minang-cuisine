import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickles_rapyd/app/data/profile_provider.dart';
import 'package:pickles_rapyd/app/models/ProfileModel.dart';
import 'package:pickles_rapyd/app/data/disbures_provider.dart';

class TransferController extends GetxController {
  late ProfileModel profile = ProfileModel();
  late int point;
  late int balance;

  bool searchStatus = false;
  List foundItems = [];

  final payList = ["John Doe", "Greg Hugo", "James Moore"];

  @override
  void onInit() async {
    super.onInit();
    foundItems = payList;
    profile = await ProfileProvider().getProfile();
    point = profile.points!;
    balance = profile.balance!;
    update();
  }

  void filterItem(String targetname) {
    List<String> results = [];
    if (targetname.isEmpty) {
      results = payList;
      searchStatus = false;
    } else {
      searchStatus = true;
      results = payList
          .where((element) =>
              element.toLowerCase().contains(targetname.toLowerCase()))
          .toList();
    }
    foundItems = results;
    update();
  }

  void donate() async {
    await DisburseProvider()
        .disburse(donationAmount.text, "John", "Doe", "112333456", "7711233");
  }
}
