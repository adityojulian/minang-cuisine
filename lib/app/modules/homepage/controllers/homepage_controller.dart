import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pickles_rapyd/app/data/profile_provider.dart';
import 'package:pickles_rapyd/app/models/ProfileModel.dart';

class HomepageController extends GetxController {
  TextEditingController pointController = TextEditingController(text: "1");
  TextEditingController gbpController = TextEditingController(text: "1");
  late ProfileModel profile;

  @override
  void onClose() {
    pointController.dispose();
    gbpController.dispose();
    super.onClose();
  }

  @override
  void onInit() async {
    profile = await ProfileProvider().getProfile();
    update();
    super.onInit();
  }
}
