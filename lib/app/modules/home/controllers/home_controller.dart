import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickles_rapyd/app/data/home_provider.dart';
import 'package:pickles_rapyd/app/models/InventoryItemModel.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final String title = 'Scan Product Barcode';
  late InventoryItemModel itemDesc;
  String itemName = "Not Found";
  String material = "Not Found";
  late final List<Tab> homeTabs = const <Tab>[
    Tab(
      text: "Barcode",
    ),
    Tab(
      text: "Receipt",
    )
  ];

  late TabController homeTabController;

  void changeIndex(int index) {}

  Future<void> getItemDesc(String id) async {
    itemDesc = await HomeProvider().getItemDesc(id);
    itemName = itemDesc.name.toString();
    material = itemDesc.material.toString();
    // print(itemDesc.name.toString());
    update();
  }

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
