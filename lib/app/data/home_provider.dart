import 'package:get/get.dart';

import 'dart:convert';
import 'package:pickles_rapyd/app/models/InventoryItemModel.dart';

class HomeProvider extends GetConnect {
  var local = "http://10.0.2.2:3000";
  var emulator = "https://5b6e-86-26-161-148.eu.ngrok.io";

  Future<InventoryItemModel> getItemDesc(String id) async {
    final body = json.encode({
      "ids": [id]
    });
    final response = await post("$emulator/trash/get-data", body);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.body.length == 0) {
        print("Item Not Found");
        return InventoryItemModel.fromJsonNotFound(id);
      }
      print(body);
      print(response.body);
      return InventoryItemModel.fromJsonItemDesc(response.body[0]);
    }
  }
}
