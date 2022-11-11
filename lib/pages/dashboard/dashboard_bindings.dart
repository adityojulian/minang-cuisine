import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:pickles_rapyd/pages/dashboard/camera_controller.dart';
import 'package:pickles_rapyd/pages/dashboard/dashboard_controller.dart';
import 'package:pickles_rapyd/pages/inventory/inventory_controller.dart';
import 'package:pickles_rapyd/pages/homepage/home_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<InventoryController>(() => InventoryController());
    // Get.lazyPut<CameraControllerGetx>(() => CameraControllerGetx());
  }
}
