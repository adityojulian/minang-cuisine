import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pickles_rapyd/app/views/views/donation_card_view.dart';

import '../controllers/donation_controller.dart';

class DonationView extends GetView<DonationController> {
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
      body: Column(
        children: [
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "0",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                    ),
                    Text("Project Involvement")
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
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                    ),
                    Text("Points Used")
                  ],
                ),
              ],
            ),
          ),
          Divider(thickness: 1),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                height: 15,
              ),
              // physics: NeverScrollableScrollPhysics(),
              // shrinkWrap: true,
              itemCount: 5,
              itemBuilder: ((context, index) => DonationCardView()),
            ),
          ),
        ],
      ),
    );
  }
}
