import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pickles_rapyd/app/models/InventoryItemModel.dart';
import 'package:pickles_rapyd/pages/inventory/inventory.dart';

class ConfirmProvider extends GetConnect {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<String> finishSession(
      List<InventoryItemModel> listItems, String location, int points) async {
    var userId = auth.currentUser!.uid;
    // var items = jsonEncode(listItems.map((e) => e.toJson()).toList());

    final body_test = {
      "user_id": userId,
      "items": listItems,
      "location": location,
      "points": points
    };

    final body = json.encode(body_test);

    print(body);

    final response = await post(
        "https://cd06-86-26-161-148.eu.ngrok.io/session/create-session", body);

    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return response.body.toString();
    }
  }
}
