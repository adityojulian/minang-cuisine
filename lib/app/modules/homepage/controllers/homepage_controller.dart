import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pickles_rapyd/app/data/profile_provider.dart';
import 'package:pickles_rapyd/app/models/ProfileModel.dart';

class HomepageController extends GetxController {
  int initialPoint = 1;
  late TextEditingController pointController;
  late TextEditingController gbpController;
  late ProfileModel profile = ProfileModel();
  late int point;

  convertPointToGBP(String value) {
    gbpController.text = (int.parse(value) * 0.01).toString();
  }

  convertGBPtoPoint(String value) {
    pointController.text = (int.parse(value) * 100).toString();
  }

  reqConvertPoints(String ewallet, String points) async {
    print("reqConvert" + ewallet + " " + points);
    String result =
        await ProfileProvider().convertPoints(ewallet, int.parse(points));
    profile = await ProfileProvider().getProfile();
    update();
  }

  @override
  void onClose() {
    pointController.dispose();
    gbpController.dispose();
    super.onClose();
  }

  @override
  void onInit() async {
    pointController = TextEditingController(text: initialPoint.toString());
    gbpController = TextEditingController(
        text: (int.parse(pointController.text) * 0.01).toString());
    // TODO: implement onInit
    super.onInit();
    profile = await ProfileProvider().getProfile();
    point = profile.points!;
    update();
  }
}
