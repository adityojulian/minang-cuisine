import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pickles_rapyd/app/views/views/carousel_map_view.dart';

import '../controllers/map_controller.dart';

class MapView extends GetView<MapController> {
  const MapView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Select Location',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: TextButton(
          onPressed: () => Get.back(),
          child: Text(
            "Back",
            style: TextStyle(
                color: Color(0xFF5DB075),
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: GetBuilder<MapController>(
        init: MapController(),
        builder: (c) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              GoogleMap(
                mapToolbarEnabled: false,
                zoomControlsEnabled: false,
                onMapCreated: (controller) {
                  c.setController(controller);
                },
                myLocationEnabled: true,
                initialCameraPosition:
                    CameraPosition(target: c.sourceLocation, zoom: 16),
                markers: {...c.currentLocationMarker, ...c.markers},
                polylines: c.polylines.values != {}
                    ? Set<Polyline>.of(c.polylines.values)
                    : {},
              ),
              AnimatedOpacity(
                opacity: 1,
                duration: const Duration(milliseconds: 300),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Container(
                    width: 400,
                    height: 130,
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: CarouselSlider(
                      carouselController: c.carouselController,
                      options: CarouselOptions(
                        onPageChanged: (value, reason) async {
                          print("reason" + reason.toString());
                          print("index dari depan: " + value.toString());
                          await c.changeMarkerFocus(value);
                        },
                        initialPage: 0,
                        enableInfiniteScroll: false,
                        autoPlay: false,
                        enlargeCenterPage: false,
                      ),
                      items: c.mapSlider,
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
