import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pickles_rapyd/app/data/inventory_provider.dart';
import 'package:pickles_rapyd/app/models/GroceryItemsModel.dart';
import 'package:pickles_rapyd/app/models/InventoryItemModel.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

class InventoryController extends GetxController {
  final String title = 'Recycle your product';
  List selected = [];
  bool selectAllStatus = false;
  bool searchStatus = false;
  List<GroceryItems> recycleItems = <GroceryItems>[];
  List<InventoryItemModel> allItems = [];

  // final List<Map<String, dynamic>> allItems = [
  //   {"name": "Printing Paper Bundles", "type": "Paper", "weight": "8gr"},
  //   {"name": "Nutella Go!", "type": "Plastic", "weight": "6gr"},
  //   {"name": "Knorr Chicken Powder", "type": "Metal", "weight": "13gr"},
  //   {"name": "Water Bottle", "type": "Plastic", "weight": "11gr"},
  //   {"name": "Tomato", "type": "Paper", "weight": "11gr"},
  // ];

  final data = {
    "items": ["12376", "45695", "34584", "95867", "23385"],
    "recycled": ["34587", "23482"],
    "waiting": ["12381", "12378"],
    "user": db.doc("users/S8awSCOSYWjmPpk8aUoM")
  };

  addToInventory() async {
    await db.collection("inventory").add(data).then(
        (documentSnapshot) => print("Added successfully"),
        onError: (e) => print("Error firebase post"));
  }

  getUserInventory() async {
    await db
        .collection("users")
        .where("user_id", isEqualTo: 1)
        .get()
        .then((value) => print(value.docs.length));
  }

  // RxList<Map<String, dynamic>> foundItems = RxList<Map<String, dynamic>>([]);
  List<InventoryItemModel> foundItems = [];

  @override
  void onInit() async {
    allItems = await InventoryProvider().getUserInventory();
    foundItems = allItems;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void filterItem(String itemName) {
    List<InventoryItemModel> results = [];
    if (itemName.isEmpty) {
      results = allItems;
      searchStatus = false;
    } else {
      searchStatus = true;
      results = allItems
          .where((element) => element.name
              .toString()
              .toLowerCase()
              .contains(itemName.toLowerCase()))
          .toList();
    }
    print({searchStatus});
    foundItems = results;
    update();
  }

  bool checkItem(int input) {
    if (selected.contains(input)) {
      return true;
    } else {
      return false;
    }
  }

  void checkboxAdd(InventoryItemModel index) {
    selected.add(index);
    print(selected.toString());
    if (selected.length == allItems.length) {
      selectAllStatus = true;
    } else {
      selectAllStatus = false;
    }
    update();
  }

  void checkboxRemove(InventoryItemModel index) {
    selected.remove(index);
    print(selected.toString());
    if (selected.length == allItems.length) {
      selectAllStatus = true;
    } else {
      selectAllStatus = false;
    }
    update();
  }

  void selectAll() {
    if (selectAllStatus == false) {
      allItems.forEach((element) {
        if (!selected.contains(element)) {
          selected.add(element);
        }
        selectAllStatus = true;
        update();
      });
    } else {
      selected = [];
      selectAllStatus = false;
      update();
      ;
    }
  }

  fetchToModel() {
    recycleItems = [];
    recycleItems.addAll(
      List<Map<String, dynamic>>.from(selected).map(
        (e) => GroceryItems.fromJson(e),
      ),
    );
    update();
  }
}
