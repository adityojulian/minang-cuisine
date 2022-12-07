import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/DonationModel.dart';
import '../models/ProfileModel.dart';
import 'dart:convert';

class DonationProvider extends GetConnect {
  FirebaseAuth auth = FirebaseAuth.instance;
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

  Future<void> donate(
    String amount,
    String first_name,
    String last_name,
    String account_number,
    String sort_code,
  ) async {
    final userId = json.encode({"id": auth.currentUser!.uid});
    final profileInfo = await post(
        "https://cd06-86-26-161-148.eu.ngrok.io/recycler/get-info", userId);
    print(profileInfo.body);
    ProfileModel data = ProfileModel.fromJson(profileInfo.body);

    final body = json.encode({
      "beneficiary": {
        "first_name": first_name,
        "last_name": last_name,
        "account_number": account_number,
        "sort_code": sort_code
      },
      "payout_amount": amount,
      "sender": {"first_name": data.firstName, "last_name": data.lastName},
      "ewallet": data.ewallet
    });

    print(body);
    final response = await post(
        "https://cd06-86-26-161-148.eu.ngrok.io/disburse/payout", body);
  }
}
