import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pickles_rapyd/app/models/InventoryItemModel.dart';

class ReceiptItemProvider extends GetConnect {
  var local = "http://10.0.2.2:3000";
  var emulator = "https://5b6e-86-26-161-148.eu.ngrok.io";

  Future<List<InventoryItemModel>> getItemDesc(List id) async {
    final body = json.encode({"ids": id});
    final response = await post("$emulator/trash/get-data", body);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.body.length == 0) {
        print("Item Not Found");
        // return InventoryItemModel.fromJsonNotFound(id);
      }
      List<InventoryItemModel> results = [];
      results.addAll(
        List<Map<String, dynamic>>.from(response.body).map(
          (e) => InventoryItemModel.fromJson(e),
        ),
      );
      print(body);
      print(response.body);
      return results;
    }
  }

  Future<void> addItemToInventory(List id) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    var userId = auth.currentUser!.uid;

    List items = [];
    id.forEach((element) {
      items.add({"id": element, "user_id": userId});
    });
    final body = json.encode({"items": items});
    print("body nya gini " + body.toString());
    final response = await post("$emulator/recycler/new-items", body);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      // if (response.body.length == 0) {
      //   print("Item Not Found");
      //   // return InventoryItemModel.fromJsonNotFound(id);
      // }
      return response.body;
    }
  }
}
