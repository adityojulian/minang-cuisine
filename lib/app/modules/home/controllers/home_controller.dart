import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final String title = 'Scan Product Barcode';

  final List<Tab> homeTabs = const <Tab>[
    Tab(
      text: "Barcode",
    ),
    Tab(
      text: "Receipt",
    )
  ];

  late TabController homeTabController;

  void changeIndex(int index) {}

  @override
  void onInit() {
    homeTabController = TabController(length: homeTabs.length, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    homeTabController.dispose();
    super.onClose();
  }
}
