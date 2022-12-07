import 'package:get/get.dart';
import 'package:pickles_rapyd/app/data/receipt_item_provider.dart';
import 'package:pickles_rapyd/app/models/InventoryItemModel.dart';
import 'package:pickles_rapyd/app/routes/app_pages.dart';

class ReceiptScanController extends GetxController {
  List barcodeList = Get.arguments;
  List<InventoryItemModel> selected = [];
  bool selectAllStatus = false;
  bool searchStatus = false;
  List<InventoryItemModel> recycleItems = <InventoryItemModel>[];
  List<InventoryItemModel> allItems = [];
  List<InventoryItemModel> foundItems = [];

  Future<void> getItem(List scanItems) async {
    allItems = await ReceiptItemProvider().getItemDesc(barcodeList);
    update();
  }

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

  addItemToInventory() async {
    // recycleItems = [];
    List<String> itemToAdd = [];
    selected.forEach((element) {
      itemToAdd.add(element.id!);
    });
    await ReceiptItemProvider().addItemToInventory(itemToAdd);
    Get.toNamed(Routes.ADD_TO_INVENTORY_SUCCESS);
    // recycleItems = selected;
    // update();
  }

  @override
  void onInit() async {
    super.onInit();
    await getItem(barcodeList);
    foundItems = allItems;
    update();
  }
}
