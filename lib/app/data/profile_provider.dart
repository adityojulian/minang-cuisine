import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pickles_rapyd/app/models/ProfileModel.dart';

class ProfileProvider extends GetConnect {
  var local = "http://10.0.2.2:3000";
  var emulator = "https://cd06-86-26-161-148.eu.ngrok.io";

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<ProfileModel> getProfile() async {
    var userId = {"id": "${auth.currentUser!.uid}"};

    final response = await post("$emulator/recycler/get-info", userId);

    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      print(response.body);
      ProfileModel result = ProfileModel.fromJson(response.body);
      print(result);
      return result;
    }
  }

  Future<String> convertPoints(String ewallet, int points) async {
    var userId = auth.currentUser!.uid;
    final body = json.encode({"recycler_ewallet": ewallet, "points": points});
    print(body);
    final response = await post(
        "https://cd06-86-26-161-148.eu.ngrok.io/recycler/points-to-money",
        body);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      // String result = json.decode("").toString();
      final confirm_body = {
        "id": response.body,
        "points": points,
        "user_id": userId,
        "response": "accept"
      };

      print(confirm_body);
      final confirm_response = await post(
          "https://cd06-86-26-161-148.eu.ngrok.io/recycler/confirm-transaction",
          confirm_body);
      return confirm_response.body.toString();
    }
  }
}
