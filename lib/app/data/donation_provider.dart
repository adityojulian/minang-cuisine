import 'package:get/get.dart';

import '../models/DonationModel.dart';

class DonationProvider extends GetConnect {
  Future<List<DonationModel>> getDonationList() async {
    print("masuk ke donation provider");
    List<DonationModel> donationList = [];
    var res = await get("http://10.0.2.2:3000/donation/get-donation");
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
