import 'package:get/get.dart';

import '../controllers/donation_detail_controller.dart';

class DonationDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DonationDetailController>(
      () => DonationDetailController(),
    );
  }
}
