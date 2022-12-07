import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pickles_rapyd/app/models/InventoryItemModel.dart';

class InventoryProvider extends GetConnect {
  var local = "http://10.0.2.2:3000";
  var emulator = "https://5b6e-86-26-161-148.eu.ngrok.io";

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<List<InventoryItemModel>> getUserInventory() async {
    var userId = {"id": "${auth.currentUser!.uid}"};
    final body = json.encode(userId);

    print(body);

    final response = await post("$emulator/recycler/get-items", userId);

    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      print(response.body);
      List<InventoryItemModel> recycleItems = [];
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
