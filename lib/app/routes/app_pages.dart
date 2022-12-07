import 'package:get/get.dart';

import '../modules/AddItem/bindings/add_item_binding.dart';
import '../modules/AddItem/views/add_item_view.dart';
import '../modules/AddItemSuccess/bindings/add_item_success_binding.dart';
import '../modules/AddItemSuccess/views/add_item_success_view.dart';
import '../modules/AddToInventorySuccess/bindings/add_to_inventory_success_binding.dart';
import '../modules/AddToInventorySuccess/views/add_to_inventory_success_view.dart';
import '../modules/CropImagePreview/bindings/crop_image_preview_binding.dart';
import '../modules/CropImagePreview/views/crop_image_preview_view.dart';
import '../modules/DonationDetail/bindings/donation_detail_binding.dart';
import '../modules/DonationDetail/views/donation_detail_view.dart';
import '../modules/DonationSuccess/bindings/donation_success_binding.dart';
import '../modules/DonationSuccess/views/donation_success_view.dart';
import '../modules/ReceiptScan/bindings/receipt_scan_binding.dart';
import '../modules/ReceiptScan/views/receipt_scan_view.dart';
import '../modules/RecycleSuccess/bindings/recycle_success_binding.dart';
import '../modules/RecycleSuccess/views/recycle_success_view.dart';
import '../modules/SetupPayment/bindings/setup_payment_binding.dart';
import '../modules/SetupPayment/views/setup_payment_view.dart';
import '../modules/TransferSuccess/bindings/transfer_success_binding.dart';
import '../modules/TransferSuccess/views/transfer_success_view.dart';
import '../modules/confirmation/bindings/confirmation_binding.dart';
import '../modules/confirmation/views/confirmation_view.dart';
import '../modules/crop/bindings/crop_binding.dart';
import '../modules/crop/views/crop_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/donation/bindings/donation_binding.dart';
import '../modules/donation/views/donation_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/homepage/bindings/homepage_binding.dart';
import '../modules/homepage/views/homepage_view.dart';
import '../modules/inventory/bindings/inventory_binding.dart';
import '../modules/inventory/views/inventory_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/map/bindings/map_binding.dart';
import '../modules/map/views/map_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/transfer/bindings/transfer_binding.dart';
import '../modules/transfer/views/transfer_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DASHBOARD;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.INVENTORY,
      page: () => InventoryView(),
      binding: InventoryBinding(),
    ),
    GetPage(
      name: _Paths.CROP,
      page: () => CropView(),
      binding: CropBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.HOMEPAGE,
      page: () => HomepageView(),
      binding: HomepageBinding(),
    ),
    GetPage(
      name: _Paths.DONATION,
      page: () => DonationView(),
      binding: DonationBinding(),
    ),
    GetPage(
      name: _Paths.MAP,
      page: () => const MapView(),
      binding: MapBinding(),
    ),
    GetPage(
      name: _Paths.CONFIRMATION,
      page: () => ConfirmationView(),
      binding: ConfirmationBinding(),
    ),
    GetPage(
      name: _Paths.RECYCLE_SUCCESS,
      page: () => const RecycleSuccessView(),
      binding: RecycleSuccessBinding(),
    ),
    GetPage(
      name: _Paths.ADD_ITEM,
      page: () => AddItemView(),
      binding: AddItemBinding(),
    ),
    GetPage(
      name: _Paths.DONATION_DETAIL,
      page: () => DonationDetailView(),
      binding: DonationDetailBinding(),
    ),
    GetPage(
      name: _Paths.DONATION_SUCCESS,
      page: () => const DonationSuccessView(),
      binding: DonationSuccessBinding(),
    ),
    GetPage(
      name: _Paths.CROP_IMAGE_PREVIEW,
      page: () => const CropImagePreviewView(),
      binding: CropImagePreviewBinding(),
    ),
    GetPage(
      name: _Paths.TRANSFER,
      page: () => const TransferView(),
      binding: TransferBinding(),
    ),
    GetPage(
      name: _Paths.SETUP_PAYMENT,
      page: () => const SetupPaymentView(),
      binding: SetupPaymentBinding(),
    ),
    GetPage(
      name: _Paths.TRANSFER_SUCCESS,
      page: () => const TransferSuccessView(),
      binding: TransferSuccessBinding(),
    ),
    GetPage(
      name: _Paths.ADD_ITEM_SUCCESS,
      page: () => const AddItemSuccessView(),
      binding: AddItemSuccessBinding(),
    ),
    GetPage(
      name: _Paths.RECEIPT_SCAN,
      page: () => const ReceiptScanView(),
      binding: ReceiptScanBinding(),
    ),
    GetPage(
      name: _Paths.ADD_TO_INVENTORY_SUCCESS,
      page: () => const AddToInventorySuccessView(),
      binding: AddToInventorySuccessBinding(),
    ),
  ];
}
