import 'package:get/get.dart';

import 'dart:convert';
import 'package:pickles_rapyd/app/models/InventoryItemModel.dart';

class HomeProvider extends GetConnect {
  Future<InventoryItemModel> getItemDesc(String id) async {
    final body = json.encode({
      "ids": [id]
    });
    final response = await post(
        "https://cd06-86-26-161-148.eu.ngrok.io/trash/get-data", body);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      print(body);
      print(response.body);
      return InventoryItemModel.fromJsonItemDesc(response.body[0]);
    }
  }
}
