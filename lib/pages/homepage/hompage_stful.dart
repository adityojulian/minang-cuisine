import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickles_rapyd/pages/homepage/home_controller.dart';

class HompageStful extends StatefulWidget {
  const HompageStful({super.key});

  @override
  State<HompageStful> createState() => _HompageStfulState();
}

class _HompageStfulState extends State<HompageStful> {
  @override
  Widget build(BuildContext context) {
    HomeController homeCon = Get.put(HomeController());
    return Scaffold();
  }
}
