import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:pickles_rapyd/app/models/GroceryItemsModel.dart';
import 'package:pickles_rapyd/app/models/InventoryItemModel.dart';
import 'package:pickles_rapyd/app/models/MapModel.dart';
import 'package:pickles_rapyd/app/routes/app_pages.dart';

class MapsSheet {
  static show({
    required Function(AvailableMap map) onMapTap,
    required List<InventoryItemModel> recycleItems,
    required MapModel recycleLocation,
  }) async {
    final availableMaps = await MapLauncher.installedMaps;

    Get.bottomSheet(
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Wrap(
                    children: <Widget>[
                      for (var map in availableMaps)
                        ListTile(
                          onTap: () {
                            Get.offNamedUntil(Routes.CONFIRMATION,
                                ModalRoute.withName(Routes.MAP),
                                arguments: [recycleItems, recycleLocation]);
                            onMapTap(map);
                          },
                          title: Text(map.mapName),
                          leading: SvgPicture.asset(
                            map.icon,
                            height: 30.0,
                            width: 30.0,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
