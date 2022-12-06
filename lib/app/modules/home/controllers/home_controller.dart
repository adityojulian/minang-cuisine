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

  Future<bool> getItemDesc(String id) async {
    itemDesc = await HomeProvider().getItemDesc(id);
    print(itemDesc.name);
    if (itemDesc.name == "Not Found") {
      return false;
    }
    itemName = itemDesc.name.toString();
    material = itemDesc.material.toString();
    // print(itemDesc.name.toString());
    update();
    return true;
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
