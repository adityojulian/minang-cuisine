import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pickles_rapyd/app/controllers/auth_controller.dart';
import 'package:pickles_rapyd/app/modules/home/views/home_view.dart';
import 'package:pickles_rapyd/app/modules/inventory/views/inventory_view.dart';
import 'package:pickles_rapyd/app/modules/homepage/views/homepage_view.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  final authCon = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
              child: IndexedStack(
            index: controller.tabIndex,
            children: [HomepageView(), HomeView(), InventoryView()],
          )),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "Homepage"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.camera), label: "Scan Items"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.inventory), label: "Inventory"),
            ],
            currentIndex: controller.tabIndex,
            onTap: (int index) => controller.changeTabIndex(index),
          ),
        );
      },
    );
  }
}
