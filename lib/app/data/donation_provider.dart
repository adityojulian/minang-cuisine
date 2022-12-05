import 'package:get/get.dart';

import '../models/DonationModel.dart';

class DonationProvider extends GetConnect {
  Future<List<DonationModel>> getDonationList() async {
    print("masuk ke donation provider");
    List<DonationModel> donationList = [];
    var res = await get(
        "https://cd06-86-26-161-148.eu.ngrok.io/donation/get-donation");
    if (res.status.hasError) {
      return Future.error(res.statusText!);
    }
    donationList.addAll(
      List<Map<String, dynamic>>.from(res.body).map(
        (e) => DonationModel.fromJson(e),
      ),
    );
    return donationList;
  }
}
