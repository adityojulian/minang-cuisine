import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickles_rapyd/pages/dashboard/camera_controller.dart';
import 'package:pickles_rapyd/pages/homepage/home_controller.dart';

class HomePage extends GetView<HomeController> {
  void openBottomSheet() {
    Get.bottomSheet(
      Container(
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
                            Text(
                              "Nutella & GO! -48g",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(width: 32),
                            Container(
                              // padding: EdgeInsets.all(3),
                              height: 20,
                              width: 76,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(76, 168, 98, 0.8),
                                  border: Border.all(color: Colors.transparent),
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
                      children: [Text("MATERIAL"), Text("Plastic")],
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
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
  // var homeController = Get.put(HomeController());

  double cameraSize(double aspectRatioSize, double aspectRationCamera) {
    double scale = aspectRatioSize * aspectRationCamera;
    if (scale < 1) {
      scale = 1 / scale;
    }
    return scale;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text(controller.title)),
        // floatingActionButton: ElevatedButton(
        //   child: const Text("Coba Lagi"),
        //   onPressed: () {},
        // ),
        body: Stack(
          children: [
            GetBuilder<CameraControllerGetx>(
                init: CameraControllerGetx(),
                builder: (c) => c.cameraController.value.isInitialized
                    ? Transform.scale(
                        scale: cameraSize(Get.size.aspectRatio,
                            c.cameraController.value.aspectRatio),
                        child: Center(child: CameraPreview(c.cameraController)))
                    : Container()),
            Center(
              child: ElevatedButton(
                onPressed: () => openBottomSheet(),
                child: Text("Saya homepage"),
              ),
            ),
          ],
        ));
    // body: GetBuilder<CameraControllerGetx>(
    //     init: CameraControllerGetx(),
    //     builder: (c) => c.cameraController.value.isInitialized
    //         ? Center(child: CameraPreview(c.cameraController))
    //         : Container()));
  }
}
