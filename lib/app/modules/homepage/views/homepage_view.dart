import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pickles_rapyd/app/routes/app_pages.dart';

import '../controllers/homepage_controller.dart';

class HomepageView extends GetView<HomepageController> {
  void openBottomSheet() {
    Get.bottomSheet(
      GetBuilder<HomepageController>(builder: (c) {
        return Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 46, right: 46),
            child: Column(
              children: [
                Container(
                  width: 32,
                  height: 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black26),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 21, bottom: 24),
                  child: Text(
                    "How many?",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Point Balance",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 21,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(112, 185, 129, 1),
                        shape: BoxShape.rectangle,
                      ),
                      child: c.profile != null
                          ? Text(
                              c.profile.points.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            )
                          : CircularProgressIndicator(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 44,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 35,
                      width: 66,
                      child: TextField(
                        controller: c.pointController,
                        keyboardType: TextInputType.number,
                        onChanged: (value) => c.convertPointToGBP(value),
                        cursorColor: Color.fromRGBO(112, 185, 129, 1),
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 11, vertical: 2),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(112, 185, 129, 1),
                                width: 2),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 11),
                      child: Text(
                        "Points",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 21),
                      child: Text(
                        "=",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                      width: 66,
                      child: TextField(
                        controller: controller.gbpController,
                        onChanged: (value) =>
                            controller.convertGBPtoPoint(value),
                        keyboardType: TextInputType.number,
                        cursorColor: Color.fromRGBO(112, 185, 129, 1),
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 11, vertical: 2),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(112, 185, 129, 1),
                                width: 2),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 11),
                      child: Text(
                        "GBP",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 15),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 54,
                ),
                SizedBox(
                  height: 32,
                  // width: 152,
                  child: ElevatedButton(
                    onPressed: () {
                      c.reqConvertPoints(
                          c.profile.ewallet!, c.pointController.text);
                      Get.back();
                    },
                    child: Text(
                      "Confirm",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(76, 168, 98, 0.8),
                      fixedSize: const Size(152, 32),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Homepage',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.toNamed(Routes.SETUP_PAYMENT),
          icon: Icon(Icons.person_2_outlined),
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GetBuilder<HomepageController>(
                        builder: (c) {
                          if (c.profile.points != null) {
                            return Text(
                              c.profile.points.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 15),
                            );
                          } else {
                            return SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Color.fromRGBO(93, 176, 117, 1),
                                strokeWidth: 2,
                              ),
                            );
                          }
                        },
                      ),
                      Text("Points")
                    ],
                  ),
                  VerticalDivider(
                      indent: 10,
                      endIndent: 10,
                      color: Color.fromRGBO(0, 0, 0, 0.3)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "0",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 15),
                      ),
                      Text("Recycled")
                    ],
                  ),
                  VerticalDivider(
                    indent: 10,
                    endIndent: 10,
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "~0g",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 15),
                      ),
                      Text("CO2")
                    ],
                  ),
                ],
              ),
            ),
            Divider(thickness: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    elevation: 0,
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SizedBox(
                      height: 130,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image(
                            image: AssetImage("assets/gradient_box.png"),
                            fit: BoxFit.cover,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Available Balance",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Colors.white),
                              ),
                              GetBuilder<HomepageController>(
                                builder: (c) {
                                  if (c.profile.balance != null) {
                                    return Text(
                                      "£" + c.profile.balance.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                          color: Colors.white),
                                    );
                                  } else {
                                    return CircularProgressIndicator(
                                      color: Color.fromRGBO(93, 176, 117, 1),
                                      strokeWidth: 4,
                                    );
                                  }
                                },
                              ),
                              Text(
                                "Pickles : 1000",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 37),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Card(
                        color: Color.fromRGBO(93, 176, 117, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () => Get.toNamed(Routes.TRANSFER),
                          child: SizedBox(
                            height: 89,
                            width: 107,
                            child: Image.asset(
                              "assets/transfer.png",
                              scale: 1,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Center(
                        child: Text(
                          "Transfer",
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Card(
                        color: Color.fromRGBO(93, 176, 117, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () => openBottomSheet(),
                          child: SizedBox(
                            height: 89,
                            width: 107,
                            child: Image.asset(
                              "assets/money_icon.png",
                              scale: 1.4,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Center(
                        child: Text(
                          "Convert points to money",
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Card(
                        color: Color.fromRGBO(93, 176, 117, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () => Get.toNamed(Routes.DONATION),
                          child: SizedBox(
                            height: 89,
                            width: 107,
                            child: Image.asset(
                              "assets/donation.png",
                              scale: 1.5,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Center(
                        child: Text(
                          "Donate to charity",
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 36),
            Text(
              "Recycled Items",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
            ),
            SizedBox(height: 15),
            Divider(thickness: 1),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(227, 227, 227, 1)),
                    height: 55,
                    width: 150,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 7.0, bottom: 6),
                          child: Text(
                            "This Month",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w700,
                                fontSize: 9),
                          ),
                        ),
                        Text(
                          "900K",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 13),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(227, 227, 227, 1)),
                    height: 55,
                    width: 150,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 7.0, bottom: 6),
                          child: Text(
                            "Total",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w700,
                                fontSize: 9),
                          ),
                        ),
                        Text(
                          "30M",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 13),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 21),
              child: Container(
                child: Image.asset("assets/bar_chart.png"),
                // height: 357,
                // decoration: BoxDecoration(
                //   border: Border.all(color: Colors.black26),
                //   borderRadius: BorderRadius.circular(10),
                // ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                "Recycled Materials",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
              ),
            ),
            SizedBox(height: 15),
            Divider(thickness: 1),
            SizedBox(
              height: 34,
            ),
            SizedBox(
              child: Image.asset("assets/pie_chart.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 27, right: 27, top: 21),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Material",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "This Month",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          Text(
                            "Average",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w400),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 21,
                            height: 21,
                            margin: EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(138, 198, 221, 1),
                                shape: BoxShape.circle),
                          ),
                          Text(
                            "Glass",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "60T",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "100T",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 21,
                            height: 21,
                            margin: EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(135, 121, 111, 1),
                                shape: BoxShape.circle),
                          ),
                          Text(
                            "Plastic",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "60T",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "100T",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 21,
                            height: 21,
                            margin: EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(215, 224, 87, 1),
                                shape: BoxShape.circle),
                          ),
                          Text(
                            "Paper",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "60T",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "100T",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 21,
                            height: 21,
                            margin: EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(241, 108, 122, 1),
                                shape: BoxShape.circle),
                          ),
                          Text(
                            "Metal",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "60T",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "100T",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
