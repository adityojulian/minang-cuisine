import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pickles_rapyd/app/routes/app_pages.dart';

class DonationCardView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(10),
        // ),
        child: InkWell(
          onTap: () => Get.toNamed(Routes.DONATION_DETAIL),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image(
                    image: AssetImage("assets/donation_one.png"),
                    height: 111,
                    fit: BoxFit.cover,
                  )
                ],
              ),
              SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "The Hunger Project UK",
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "UK’s government project for developing countries",
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 11),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
