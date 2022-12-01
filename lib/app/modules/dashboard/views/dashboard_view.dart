import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pickles_rapyd/app/controllers/auth_controller.dart';
import 'package:pickles_rapyd/app/modules/home/views/home_view.dart';
import 'package:pickles_rapyd/app/modules/inventory/views/inventory_view.dart';
import 'package:pickles_rapyd/app/modules/homepage/views/homepage_view.dart';
import 'package:pickles_rapyd/app/routes/app_pages.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  final authCon = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          body: Navigator(
            key: Get.nestedKey(1),
            initialRoute: Routes.HOMAPAGE,
            onGenerateRoute: controller.onGenerateRoute,
          ),
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
