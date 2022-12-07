import 'dart:async';
import 'dart:math';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pickles_rapyd/app/models/MapModel.dart';
import 'package:pickles_rapyd/app/views/views/carousel_map_view.dart';

class MapController extends GetxController {
  var result = [
    {
      "id": "Recycle Station Aldi",
      "name": "Aldi",
      "latitude": 52.4446,
      "longitude": -1.9354,
      "materials": ["Plastic", "Glass", "Cardboard"]
    },
    {
      "id": "Recycle Station Tesco",
      "name": "Tesco Express Selly Oak",
      "latitude": 52.4467,
      "longitude": -1.9308,
      "materials": ["Plastic", "Metal"]
    },
    {
      "id": "Recycle Station Seoul Plaza",
      "name": "Seoul Plaza",
      "latitude": 52.4459,
      "longitude": -1.9323,
      "materials": ["Plastic", "Cardboard"]
    },
    {
      "id": "Recycle Station Sainsbury's",
      "name": "Sainsbury's",
      "latitude": 52.4432,
      "longitude": -1.9388,
      "materials": ["Plastic", "Bottle", "Glass", "Cardboard", "Metal"]
    },
    {
      "id": "Recycle Station Police Station",
      "name": "Police Station Selly Oak",
      "latitude": 52.439,
      "longitude": -1.9266,
      "materials": ["Glass"]
    },
    {
      "id": "Recycle Station CocoBab",
      "name": "CocoBab",
      "latitude": 52.4372,
      "longitude": -1.9293,
      "materials": ["Plastic", "Metal"]
    },
    {
      "id": "Recycle Station Selly Park",
      "name": "Selly Park",
      "latitude": 52.4421,
      "longitude": -1.9239,
      "materials": ["Glass", "Metal"]
    }
  ];

  // Maps and Markers

  late GoogleMapController mapController;

  LatLng sourceLocation = LatLng(52.4430, -1.9292);

  bool visible = false;
  bool carouselVisible = true;

  void setController(GoogleMapController controllerFromWidget) {
    mapController = controllerFromWidget;
    update();
  }

  fetchLocations() {
    mapModel.addAll(
      List<Map<String, dynamic>>.from(result).map(
        (e) => MapModel.fromJson(e),
      ),
    );
    update();
  }

  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  late var markerIcon;
  late var currentLocationIcon;

  List<MapModel> mapModel = <MapModel>[];
  var markers = Set<Marker>();
  var currentLocationMarker = Set<Marker>();

  String distance = "";

  int? indexTap;
  bool triggeredByTap = false;

  createMarkers() async {
    await createCurrentLocationIcon();
    await createMarkerIcon();
    currentLocationMarker.add(
      Marker(
        markerId: MarkerId(
          "Current Location",
        ),
        icon: currentLocationIcon,
        position: LatLng(sourceLocation.latitude, sourceLocation.longitude),
        infoWindow: InfoWindow(
          title: "Current Location",
          onTap: () {
            print("Marker tapped.");
          },
        ),
      ),
    );
    mapModel.forEach(
      (element) {
        mapModel[mapModel.indexOf(element)].distance = _coordinateDistance(
            sourceLocation.latitude,
            sourceLocation.longitude,
            element.latitude!,
            element.longitude!);
        print("test map " +
            mapModel[mapModel.indexOf(element)].toJson().toString());
      },
    );
    mapModel.sort((a, b) => a.distance.compareTo(b.distance));
    mapModel.forEach(
      (element) {
        markers.add(
          Marker(
            markerId: MarkerId(
              element.id.toString(),
            ),
            icon: markerIcon,
            position: LatLng(element.latitude!, element.longitude!),
            infoWindow: InfoWindow(
              title: element.name,
              snippet: distance,
            ),
            onTap: () async {
              // print("mapModel " + mapModel[0].toJson().toString());
              // await createPolylines(
              //     sourceLocation.latitude,
              //     sourceLocation.longitude,
              //     element.latitude!,
              //     element.longitude!);
              // print("visible: " + visible.toString());
              // carouselVisible = true;
              print("index on tap: " + mapModel.indexOf(element).toString());
              triggeredByTap = true;
              indexTap = mapModel.indexOf(element);
              await changeMarkerFocus(mapModel.indexOf(element));
              // carouselController.animateToPage(mapModel.indexOf(element));
              // distance = calculateRealDistance();
              // update();
            },
          ),
        );
      },
    );
    print("first marker: " + markers.first.toString());
    update();
  }

  createMarkerIcon() async {
    markerIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "assets/recycle-bin-128.png");
    update();
  }

  createCurrentLocationIcon() async {
    currentLocationIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "assets/current_location.png");
    update();
  }

  changeMarkerFocus(int index) async {
    if (triggeredByTap) {
      if (index != indexTap!) {
        index = indexTap!;
        print("index carousel: " + index.toString());

        await mapController.animateCamera(
          CameraUpdate.newLatLng(
            LatLng(mapModel[index].latitude!, mapModel[index].longitude!),
          ),
        );
        await mapController
            .showMarkerInfoWindow(markers.elementAt(index).markerId);
        await createPolylines(sourceLocation.latitude, sourceLocation.longitude,
            mapModel[index].latitude!, mapModel[index].longitude!);
        await carouselController.animateToPage(index);
        triggeredByTap = false;
        update();
      } else {
        await mapController.animateCamera(
          CameraUpdate.newLatLng(
            LatLng(mapModel[index].latitude!, mapModel[index].longitude!),
          ),
        );
        await mapController
            .showMarkerInfoWindow(markers.elementAt(index).markerId);
        await createPolylines(sourceLocation.latitude, sourceLocation.longitude,
            mapModel[index].latitude!, mapModel[index].longitude!);
        await carouselController.animateToPage(index);
        triggeredByTap = false;
        update();
      }
    } else {
      await mapController.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(mapModel[index].latitude!, mapModel[index].longitude!),
        ),
      );
      await mapController
          .showMarkerInfoWindow(markers.elementAt(index).markerId);
      await createPolylines(sourceLocation.latitude, sourceLocation.longitude,
          mapModel[index].latitude!, mapModel[index].longitude!);
      await carouselController.animateToPage(index);
      update();
    }
  }

  // POLYLINES FOR MAP //

  // Object for PolylinePoints
  late PolylinePoints polylinePoints;

  // List of coordinates to join
  List<LatLng> polylineCoordinates = [];

// Map storing polylines created by connecting two points
  Map<PolylineId, Polyline> polylines = {};

  bool creatingPolylines = false;

  double? prevLocation;

  Future<void> createPolylines(
    double startLatitude,
    double startLongitude,
    double destinationLatitude,
    double destinationLongitude,
  ) async {
    creatingPolylines = true;

    double nextLocation = startLatitude +
        startLatitude +
        destinationLatitude +
        destinationLongitude;

    if (prevLocation == null) {
      prevLocation = nextLocation;
    } else {
      if (prevLocation == nextLocation) {
        return;
      } else {
        prevLocation = nextLocation;
      }
    }

    polylines = {};
    polylineCoordinates = [];
    // Initializing PolylinePoints
    polylinePoints = PolylinePoints();

    // Generating the list of coordinates to be used for
    // drawing the polylines
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "YOUR API KEY HERE", // Google Maps API Key
      PointLatLng(startLatitude, startLongitude),
      PointLatLng(destinationLatitude, destinationLongitude),
      travelMode: TravelMode.walking,
    );

    // Adding the coordinates to the list
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    calculateRealDistance();
    print("distance" + distance);

    // Defining an ID
    PolylineId id = PolylineId('poly');

    // Initializing Polyline
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: polylineCoordinates,
      width: 3,
    );

    // Adding the polyline to the map
    polylines[id] = polyline;
    print("polylines: " + polylines[id].toString());

    visible = true;
    creatingPolylines = false;
    update();
  }

  void calculateRealDistance() {
    print("masuk calculate distance");
    double totalDistance = 0.0;

// Calculating the total distance by adding the distance
// between small segments
    for (int i = 0; i < polylineCoordinates.length - 1; i++) {
      totalDistance += _coordinateDistance(
        polylineCoordinates[i].latitude,
        polylineCoordinates[i].longitude,
        polylineCoordinates[i + 1].latitude,
        polylineCoordinates[i + 1].longitude,
      );
    }
    if (totalDistance < 1) {
      int roundedDistance = (totalDistance * 1000).round();
      distance = "Distance from your location: $roundedDistance meter";
      update();
    } else {
      distance = "Distance from your location: ${totalDistance.round()} KM";
      update();
    }
  }

  // Carousel Items for Map
  CarouselController carouselController = CarouselController();

  late List<Widget> mapSlider;

  createCarouse() {
    // mapModel.sort((a, b) => a.distance.compareTo(b.distance));
    // print("sorted map model " + mapModel.last.toJson().toString());
    mapSlider = mapModel
        .map((e) => CarouselMapView(
              mapItem: e,
              currentLocation: sourceLocation,
              recycleItems: Get.arguments,
            ))
        .toList();
    update();
  }

  @override
  void onInit() async {
    // createMarkerIcon();
    fetchLocations();
    await createMarkers();
    createCarouse();
    update();
    super.onInit();
  }

  @override
  void onReady() {
    print(Get.arguments.toString());
    super.onReady();
  }

  @override
  void onClose() {
    mapController.dispose();
    super.onClose();
  }
}
