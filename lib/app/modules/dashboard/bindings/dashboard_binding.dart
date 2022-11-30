import 'package:get/get.dart';
import 'package:pickles_rapyd/app/modules/home/controllers/home_controller.dart';
import 'package:pickles_rapyd/app/modules/homepage/controllers/homepage_controller.dart';
import 'package:pickles_rapyd/app/modules/inventory/controllers/inventory_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<InventoryController>(
      () => InventoryController(),
    );
    Get.lazyPut<HomepageController>(
      () => HomepageController(),
    );
  }
}
