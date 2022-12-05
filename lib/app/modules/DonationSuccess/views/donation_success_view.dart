import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pickles_rapyd/app/routes/app_pages.dart';

import '../controllers/donation_success_controller.dart';

class DonationSuccessView extends GetView<DonationSuccessController> {
  const DonationSuccessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(76, 168, 98, 0.8),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 287,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Thank you!",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  Image.asset("assets/check_success.png"),
                  Text(
                    "YOUR DONATION WAS SUCCESSFULL",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF666666),
                    ),
                  ),
                  Text(
                    "A RECEIPT WAS SENT TO YOUR EMAIL",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(0, 170, 48, 1),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () => {Get.offAllNamed(Routes.DASHBOARD)},
                          child: Text(
                            "Back to Home Page",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(76, 168, 98, 0.8),
                            fixedSize: const Size(152, 32),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
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
        ),
      ),
    );
  }
}
