import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/donation_detail_controller.dart';

class DonationDetailView extends GetView<DonationDetailController> {
  const DonationDetailView({Key? key}) : super(key: key);
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
      body: Center(
        child: Text(
          'DonationDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
