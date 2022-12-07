import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/DonationModel.dart';
import '../models/ProfileModel.dart';
import 'dart:convert';

class DisburseProvider extends GetConnect {
  var local = "http://10.0.2.2:3000";
  var emulator = "https://5b6e-86-26-161-148.eu.ngrok.io";

  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> disburse(
    String amount,
    String first_name,
    String last_name,
    String account_number,
    String sort_code,
  ) async {
    final userId = json.encode({"id": auth.currentUser!.uid});
    final profileInfo = await post("$emulator/recycler/get-info", userId);
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
  }
}
