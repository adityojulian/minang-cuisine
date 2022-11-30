import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pickles_rapyd/app/models/ProfileModel.dart';

class ProfileProvider extends GetConnect {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<ProfileModel> getProfile() async {
    var userId = {"ini id saya": "${auth.currentUser!.uid}"};

    final response =
        await post("http://10.0.2.2:3000/recycler/get-info", userId);

    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      print(response.body);
      ProfileModel result = ProfileModel.fromJson(response.body);
      print(result);
      return result;
    }
  }
}
