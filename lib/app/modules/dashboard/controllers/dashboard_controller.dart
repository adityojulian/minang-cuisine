import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickles_rapyd/app/modules/home/bindings/home_binding.dart';
import 'package:pickles_rapyd/app/modules/home/controllers/home_controller.dart';
import 'package:pickles_rapyd/app/modules/home/views/home_view.dart';
import 'package:pickles_rapyd/app/modules/homepage/bindings/homepage_binding.dart';
import 'package:pickles_rapyd/app/modules/homepage/controllers/homepage_controller.dart';
import 'package:pickles_rapyd/app/modules/homepage/views/homepage_view.dart';
import 'package:pickles_rapyd/app/modules/inventory/bindings/inventory_binding.dart';
import 'package:pickles_rapyd/app/modules/inventory/controllers/inventory_controller.dart';
import 'package:pickles_rapyd/app/modules/inventory/views/inventory_view.dart';
import 'package:pickles_rapyd/app/routes/app_pages.dart';

class DashboardController extends GetxController {
  var tabIndex = 0;

  final pages = <String>[Routes.HOMAPAGE, Routes.HOME, Routes.INVENTORY];

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == Routes.HOMAPAGE) {
      return GetPageRoute(
        settings: settings,
        page: () => HomepageView(),
        binding: HomepageBinding(),
      );
    }
    if (settings.name == Routes.HOME) {
      return GetPageRoute(
        settings: settings,
        page: () => HomeView(),
        binding: HomeBinding(),
      );
    }
    if (settings.name == Routes.INVENTORY) {
      return GetPageRoute(
        settings: settings,
        page: () => InventoryView(),
        binding: InventoryBinding(),
      );
    }
    return null;
  }

  void changeTabIndex(int index) {
    if (tabIndex == index) {
      return;
    }
    tabIndex = index;
    if (index == 0) {
      Get.delete<HomeController>();
      Get.delete<InventoryController>();
    }
    if (index == 1) {
      Get.delete<HomepageController>();
      Get.delete<InventoryController>();
    }
    if (index == 2) {
      Get.delete<HomepageController>();
      Get.delete<HomeController>();
    }
    Get.offNamed(pages[index], id: 1);
    print(tabIndex);
    update();
  }
}
