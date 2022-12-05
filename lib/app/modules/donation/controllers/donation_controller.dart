import 'package:get/get.dart';
import 'package:pickles_rapyd/app/data/donation_provider.dart';
import 'package:pickles_rapyd/app/models/DonationModel.dart';

class DonationController extends GetxController {
  List<DonationModel> donations = [];

  getDonationList() async {
    donations = await DonationProvider().getDonationList();
    update();
  }

  @override
  void onInit() async {
    print("masuk on init donation");
    await getDonationList();
    super.onInit();
  }
}
