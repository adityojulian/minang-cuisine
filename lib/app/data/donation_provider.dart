import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/DonationModel.dart';
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
    int amount,
    String first_name,
    String last_name,
    String account_number,
    String sort_code,
  ) async {
    final userId = json.encode({"id": auth.currentUser!.uid});
  }
}
