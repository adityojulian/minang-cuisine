import 'package:get/get.dart';

class InventoryController extends GetxController {
  final String title = 'Recycle your product';
  List selected = [];
  bool selectAllStatus = false;
  bool searchStatus = false;

  final List<Map<String, dynamic>> allItems = [
    {"name": "printing paper bundles", "type": "paper", "weight": "8gr"},
    {"name": "nutella go!", "type": "plastic", "weight": "6gr"},
    {"name": "Knorr Chicken Powder", "type": "Metal", "weight": "13gr"},
    {"name": "water bottle", "type": "plastic", "weight": "11gr"},
    {"name": "tomato", "type": "paper", "weight": "11gr"},
  ];

  // RxList<Map<String, dynamic>> foundItems = RxList<Map<String, dynamic>>([]);
  List foundItems = [];

  @override
  void onInit() {
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
    List<Map<String, dynamic>> results = [];
    if (itemName.isEmpty) {
      results = allItems;
      searchStatus = false;
    } else {
      searchStatus = true;
      results = allItems
          .where((element) => element["name"]
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

  void checkboxAdd(String index) {
    selected.add(index);
    print(selected.toString());
    if (selected.length == allItems.length) {
      selectAllStatus = true;
    } else {
      selectAllStatus = false;
    }
    update();
  }

  void checkboxRemove(String index) {
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
        if (!selected.contains(element["name"])) {
          selected.add(element["name"]);
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
}
