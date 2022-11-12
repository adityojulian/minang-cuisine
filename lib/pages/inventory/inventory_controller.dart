import 'package:get/get.dart';

class InventoryController extends GetxController {
  final String title = 'Recycle your product';
  List selected = [];

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
    } else {
      results = allItems
          .where((element) => element["name"]
              .toString()
              .toLowerCase()
              .contains(itemName.toLowerCase()))
          .toList();
    }
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
    update();
  }

  void checkboxRemove(String index) {
    selected.remove(index);
    print(selected.toString());
    update();
  }
}
