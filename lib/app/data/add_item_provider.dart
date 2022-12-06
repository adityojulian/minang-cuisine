import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddItemProvider extends GetConnect {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> addNewItem(String name, String id, String material, String type,
      double weight, bool recycle) async {
    var userId = auth.currentUser!.uid;
    final body = json.encode({
      "user_id": userId,
      "items": [
        {
          "id": id,
          "material": material,
          "name": name,
          "recycle": true,
          "type": type,
          "weight": weight
        }
      ]
    });

    final response = await post(
        "https://cd06-86-26-161-148.eu.ngrok.io/recycler/add-item", body);
    print(response.body.toString());
    print(body);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    }
  }
}
