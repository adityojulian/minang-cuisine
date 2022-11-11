import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:pickles_rapyd/pages/homepage/homapage.dart';
import 'package:pickles_rapyd/pages/inventory/inventory.dart';
import 'package:pickles_rapyd/routes/app_page.dart';
import 'package:pickles_rapyd/routes/route_name.dart';
import 'firebase_options.dart';

List<CameraDescription> cameras = [];

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(GetMaterialApp(
    title: "Pickles Application",
    // home: HomePage(),
    initialRoute: RouteName.dashboard,
    getPages: AppPages.pages,
  ));
}
