import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pickles_rapyd/app/models/InventoryItemModel.dart';

class InventoryProvider extends GetConnect {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<List<InventoryItemModel>> getUserInventory() async {
    var userId = {"id": "${auth.currentUser!.uid}"};
    final body = json.encode(userId);

    print(body);

    final response = await post(
        "https://cd06-86-26-161-148.eu.ngrok.io/recycler/get-items", userId);

    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      List<InventoryItemModel> recycleItems = [];
      // print(response.body.length);

      recycleItems.addAll(
        List<Map<String, dynamic>>.from(response.body).map(
          (e) => InventoryItemModel.fromJson(e),
        ),
      );
      print(recycleItems[0].toJson().toString());
      return recycleItems;
    }
  }
}
