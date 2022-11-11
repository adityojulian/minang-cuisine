import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickles_rapyd/pages/dashboard/dashboard_controller.dart';
import 'package:pickles_rapyd/pages/homepage/homapage.dart';
import 'package:pickles_rapyd/pages/inventory/inventory.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
              child: IndexedStack(
            index: controller.tabIndex,
            children: [HomePage(), Inventory()],
          )),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "Homepage"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.inventory), label: "Inventory"),
            ],
            currentIndex: controller.tabIndex,
            onTap: (int index) => controller.changeTabIndex(index),
          ),
          // bottomNavigationBar: ConvexAppBar(
          //   items: const [
          //     TabItem(icon: Icons.home, title: "Homepage"),
          //     TabItem(icon: Icons.inventory, title: "Inventory")
          //   ],
          //   initialActiveIndex: controller.tabIndex,
          //   onTap: (int i) => controller.changeTabIndex(i),
          // ),
        );
      },
    );
  }
}
