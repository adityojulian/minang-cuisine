import 'package:get/get.dart';
import 'package:pickles_rapyd/app/models/GroceryItemsModel.dart';
import 'package:pickles_rapyd/app/models/MapModel.dart';

class ConfirmationController extends GetxController {
  List<GroceryItems> recycleItems = Get.arguments[0];
  MapModel recylceLocation = Get.arguments[1];

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
