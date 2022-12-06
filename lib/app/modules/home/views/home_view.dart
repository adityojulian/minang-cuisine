import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:pickles_rapyd/app/controllers/auth_controller.dart';
import 'package:pickles_rapyd/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:pickles_rapyd/app/modules/home/controllers/barcode_camera_controller.dart';
import 'package:pickles_rapyd/app/modules/home/views/camera_screent.dart';
import 'package:pickles_rapyd/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authCon = Get.find<AuthController>();

  void openBottomSheet() {
    Get.bottomSheet(
      GetBuilder<HomeController>(builder: (c) {
        return Container(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Container(
                  child: Row(children: [
                    Container(
                      width: 58,
                      height: 58,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new NetworkImage(
                                  "https://i.imgur.com/BoN9kdC.png"))),
                    ),
                    SizedBox(width: 19),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 135,
                                height: 30,
                                child: AutoSizeText(
                                  c.itemName,
                                  minFontSize: 12,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              SizedBox(width: 32),
                              Container(
                                // padding: EdgeInsets.all(3),
                                height: 20,
                                width: 76,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(76, 168, 98, 0.8),
                                    border:
                                        Border.all(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: Text(
                                    'Recycleable',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ]),
                        SizedBox(height: 10),
                        Container(
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Nutella, Ferrero",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontSize: 12),
                                )))
                      ],
                    ),
                  ]),
                ),
                SizedBox(height: 8),
                Container(
                  // width: 330,
                  height: 61,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color.fromRGBO(217, 217, 217, 1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Text("MATERIAL"), Text(c.material)],
                      ),
                      VerticalDivider(
                          indent: 10,
                          endIndent: 10,
                          color: Color.fromRGBO(0, 0, 0, 0.3)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Text("REWARD"), Text("1p")],
                      ),
                      VerticalDivider(
                        indent: 10,
                        endIndent: 10,
                        color: Color.fromRGBO(0, 0, 0, 0.3),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Text("SAVED C02"), Text("No data")],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 11),
                Container(
                  height: 81,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color.fromRGBO(76, 168, 98, 0.3)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Daily Reward Collected",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w700),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: Text(
                            "You can only collect rewards for this package 1 time per day",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12),
                          ),
                        )
                      ]),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(0, 0, 0, 0.8),
                            fixedSize: const Size(152, 32),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('Close',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Colors.white))),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(76, 168, 98, 0.8),
                            fixedSize: const Size(152, 32),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text(
                          'Add to Inventory',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 12),
                        )),
                  ],
                ),
              ],
            ),
          ),
          height: 350,
        );
      }),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  void notFoundBottomSheet(String id) {
    Get.bottomSheet(
      Container(
        height: 360,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 9.0),
                child: Container(
                  width: 32,
                  height: 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black26),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 20),
                  Container(
                    // width: 300,
                    height: 61,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromRGBO(217, 217, 217, 1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [Text("MATERIAL"), Text("Read on pack")],
                        ),
                        VerticalDivider(
                            indent: 10,
                            endIndent: 10,
                            color: Color.fromRGBO(0, 0, 0, 0.3)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [Text("REWARD"), Text("1p")],
                        ),
                        VerticalDivider(
                          indent: 10,
                          endIndent: 10,
                          color: Color.fromRGBO(0, 0, 0, 0.3),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [Text("SAVED C02"), Text("No data")],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Card(
                    elevation: 0,
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SizedBox(
                      height: 128,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image(
                            image: AssetImage("assets/placeholder_nf.png"),
                            fit: BoxFit.cover,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Product Not Found",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: Colors.white),
                              ),
                              Text(
                                "Earn 1 extra point by adding package information",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 32,
                                child: ElevatedButton(
                                  onPressed: () => Get.toNamed(Routes.ADD_ITEM,
                                      arguments: id),
                                  child: Text(
                                    "Add Item",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    elevation: 1,
                                    backgroundColor:
                                        Color.fromRGBO(76, 168, 98, 0.8),
                                    fixedSize: const Size(152, 32),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () => Get.back(),
                      child: Text(
                        "Close",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // DashboardController dashboardController = Get.find<DashboardController>();
    return GetBuilder<DashboardController>(
      builder: (dashboardCon) {
        return dashboardCon.tabIndex == 1
            ? Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  centerTitle: true,
                  title: Text(
                    controller.title,
                    style: TextStyle(color: Colors.black),
                  ),
                  bottom: TabBar(
                    labelColor: Colors.black,
                    indicatorColor: Colors.green,
                    tabs: controller.homeTabs,
                    indicatorWeight: 5,
                    controller: controller.homeTabController,
                  ),
                  elevation: 0,
                  actions: [
                    IconButton(
                        onPressed: () => authCon.logout(),
                        icon: Icon(
                          Icons.logout,
                          color: Colors.black,
                        ))
                  ],
                ),
                body: TabBarView(
                  controller: controller.homeTabController,
                  children: [
                    Stack(
                      children: [SizedBox(child: CameraScreen())],
                    ),
                    // Container()
                    Stack(
                      children: [
                        SizedBox(
                          width: Get.width,
                          height: Get.height - AppBar().preferredSize.height,
                          child: GetBuilder<BarcodeCameraController>(
                            init: BarcodeCameraController(),
                            builder: (c) {
                              return MobileScanner(
                                  allowDuplicates: false,
                                  onDetect: (barcode, args) async {
                                    if (barcode.rawValue == null) {
                                      debugPrint('Failed to scan Barcode');
                                    } else {
                                      if (await controller
                                          .getItemDesc(barcode.rawValue!)) {
                                        openBottomSheet();
                                      } else {
                                        notFoundBottomSheet(barcode.rawValue!);
                                      }

                                      final String code = barcode.rawValue!;
                                      debugPrint('Barcode found! $code');
                                    }
                                  });
                            },
                          ),
                        ),
                        Center(
                          child: ElevatedButton(
                              onPressed: () => {},
                              child: Text("Test Not Found")),
                        )
                      ],
                    ),
                  ],
                ),
              )
            : Container();
      },
    );
  }
}
