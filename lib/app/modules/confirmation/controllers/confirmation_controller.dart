import 'package:get/get.dart';
import 'package:pickles_rapyd/app/data/confirmation_provider.dart';
import 'package:pickles_rapyd/app/models/GroceryItemsModel.dart';
import 'package:pickles_rapyd/app/models/InventoryItemModel.dart';
import 'package:pickles_rapyd/app/models/MapModel.dart';

class ConfirmationController extends GetxController {
  List<InventoryItemModel> recycleItems = Get.arguments[0];
  MapModel recylceLocation = Get.arguments[1];

  reqConfirm() async {
    var result = await ConfirmProvider().finishSession(
        recycleItems, recylceLocation.name!, recycleItems.length);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
