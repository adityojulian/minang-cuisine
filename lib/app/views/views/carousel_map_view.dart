import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:pickles_rapyd/app/models/GroceryItemsModel.dart';
import 'package:pickles_rapyd/app/models/InventoryItemModel.dart';
import 'package:pickles_rapyd/app/views/views/material_chip_view.dart';

import '../../models/MapModel.dart';
import 'MapsSheet.dart';

class CarouselMapView extends GetView {
  CarouselMapView(
      {super.key,
      required this.mapItem,
      required this.currentLocation,
      required this.recycleItems});
  final MapModel mapItem;
  final LatLng currentLocation;
  final List<InventoryItemModel> recycleItems;

  void openBottomSheet() {
    Get.bottomSheet(
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      SizedBox(
        height: 350,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 21, horizontal: 30),
          child: Column(
            children: [
              Container(
                width: 32,
                height: 4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black26),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      mapItem.name!,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    "${distanceToString(mapItem.distance)} away - Public Recyling Location",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Umberslade Road, cnr Pershore Road, Stirchley, Birmingham, B29 7SD",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.black54),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "MATERIALS YOU CAN RECYLCE HERE",
                    style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        color: Colors.black26),
                  ),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: mapItem.materials!
                        .map((e) => MaterialChipView(material: e))
                        .toList(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => {
                        MapsSheet.show(
                            onMapTap: (map) {
                              map.showDirections(
                                  destination: Coords(
                                    mapItem.latitude!,
                                    mapItem.longitude!,
                                  ),
                                  destinationTitle: mapItem.name,
                                  origin: Coords(currentLocation.latitude,
                                      currentLocation.longitude),
                                  originTitle: "Current location",
                                  directionsMode: DirectionsMode.walking);
                            },
                            recycleItems: recycleItems,
                            recycleLocation: mapItem)
                      },
                      child: Text(
                        "Get Directions",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(76, 168, 98, 0.8),
                        fixedSize: const Size(152, 32),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () => Get.back(),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            color: Color.fromRGBO(76, 168, 98, 0.8),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );

    void openMapSheet() {}
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.only(
            top: 17,
            left: 12,
            right: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new NetworkImage(
                            "https://i.imgur.com/hDS6kU3.jpeg"),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        mapItem.name!,
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                      SizedBox(height: 4),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            distanceToString(mapItem.distance),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(width: 20),
                          SizedBox(
                            width: 150,
                            height: 30,
                            child: AutoSizeText(
                              mapItem.materials!.join(", "),
                              maxLines: 3,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                              minFontSize: 10,
                              stepGranularity: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 33,
                width: 107,
                child: ElevatedButton(
                  onPressed: () => openBottomSheet(),
                  child: Text(
                    "Details",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(76, 168, 98, 0.8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String distanceToString(double distFrac) {
    if (distFrac < 1) {
      int roundedDistance = (distFrac * 1000).round();
      return "$roundedDistance meter";
    }
    return "${distFrac.round()} KM";
  }
}
