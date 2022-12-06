import 'package:get/get.dart';
import 'package:pickles_rapyd/app/data/profile_provider.dart';
import 'package:pickles_rapyd/app/models/ProfileModel.dart';

class SetupPaymentController extends GetxController {
  late ProfileModel profile = ProfileModel();
  late int point;
  late int balance;

  @override
  void onInit() async {
    super.onInit();
    profile = await ProfileProvider().getProfile();
    point = profile.points!;
    balance = profile.balance!;
    update();
  }
}
