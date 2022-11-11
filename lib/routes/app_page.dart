import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pickles_rapyd/pages/dashboard/dashboard.dart';
import 'package:pickles_rapyd/pages/dashboard/dashboard_bindings.dart';
import 'package:pickles_rapyd/pages/homepage/homapage.dart';
import 'package:pickles_rapyd/pages/inventory/inventory.dart';
import 'package:pickles_rapyd/pages/testing_page/testing_page.dart';
import 'package:pickles_rapyd/routes/route_name.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: RouteName.dashboard,
        page: () => DashboardPage(),
        binding: DashboardBinding()),
    GetPage(name: RouteName.home, page: () => HomePage()),
    GetPage(name: RouteName.inventory, page: () => Inventory()),
    GetPage(name: RouteName.testpage, page: () => TestPage())
  ];
}
