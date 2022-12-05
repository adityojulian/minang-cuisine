import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pickles_rapyd/app/models/DonationModel.dart';
import 'package:pickles_rapyd/app/routes/app_pages.dart';

class DonationCardView extends GetView {
  DonationCardView({super.key, required this.donation});
  DonationModel donation;

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
          onTap: () => Get.toNamed(Routes.DONATION_DETAIL, arguments: donation),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image(
                    image: AssetImage(donation.asset!),
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
                      donation.name!,
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      donation.desc!,
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
