import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pickles_rapyd/app/models/DonationModel.dart';
import 'package:pickles_rapyd/app/routes/app_pages.dart';

import '../controllers/donation_detail_controller.dart';

class DonationDetailView extends GetView<DonationDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        leading: TextButton(
          onPressed: () => Get.back(),
          child: Text(
            "Back",
            style: TextStyle(
                color: Color(0xFF5DB075),
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        ),
        title: const Text(
          'Projects',
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              // height: 160,
              // width: 270,
              child: Image.asset(
                controller.donation.asset!,
                fit: BoxFit.contain,
                scale: 1,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              controller.donation.name!,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
            SizedBox(
              height: 9,
            ),
            Text(
              controller.donation.desc!,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 11,
              ),
            ),
            SizedBox(
              height: 18,
            ),
            ClipRRect(
              child: Stack(children: [
                Image.asset(
                  "assets/box_green_gradient.png",
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 135,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          " Amount",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 11),
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Stack(
                          children: [
                            SizedBox(
                              height: 33,
                              width: 293,
                              child: TextField(
                                controller: controller.donationAmount,
                                onTapOutside: (event) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                // onChanged: (value) => controller.convertGBPtoPoint(value),
                                keyboardType: TextInputType.number,
                                cursorColor: Color.fromRGBO(112, 185, 129, 1),
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w400),
                                decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  filled: true,
                                  fillColor: Colors.white,
                                  label: Text.new(
                                    "Amount to donate",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Colors.black26),
                                  ),
                                  contentPadding: EdgeInsets.only(left: 60),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                        color: Colors.grey, width: 1),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                        color: Color.fromRGBO(0, 0, 0, 0.2),
                                        width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                        color: Color.fromRGBO(0, 0, 0, 0.2),
                                        width: 2),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 33,
                              width: 49,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromRGBO(0, 0, 0, 0.2)),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white),
                              child: Center(
                                child: Icon(
                                  Icons.currency_pound_rounded,
                                  size: 17,
                                  // weight: 20,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Balance: 0 £",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: Colors.red),
                            ),
                            Text(
                              "Min. amount: 1 £",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 27,
                          // width: 152,
                          child: ElevatedButton(
                            onPressed: () =>
                                Get.toNamed(Routes.DONATION_SUCCESS),
                            child: Text(
                              "Donate",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w600),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(76, 168, 98, 0.8),
                              fixedSize: const Size(152, 32),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // decoration: BoxDecoration(
                  //     boxShadow: [
                  //       BoxShadow(
                  //           color: Color.fromRGBO(0, 0, 0, 0.25),
                  //           offset: Offset(0, 4),
                  //           blurRadius: 4)
                  //     ],
                  //     // border: Border.all(),
                  //     color: Colors.green[200],
                  //     shape: BoxShape.rectangle,
                  //     borderRadius: BorderRadius.circular(20)),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
