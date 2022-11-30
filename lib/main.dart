import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:pickles_rapyd/app/controllers/auth_controller.dart';
import 'package:pickles_rapyd/app/utils/loading.dart';
import 'package:pickles_rapyd/pages/homepage/homapage.dart';
import 'package:pickles_rapyd/pages/inventory/inventory.dart';
import 'package:pickles_rapyd/routes/route_name.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

List<CameraDescription> cameras = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authController = Get.put(AuthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authController.streamAuthStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          print(snapshot.data);
          return GetMaterialApp(
            title: "Pickles Application",
            initialRoute:
                snapshot.data != null ? Routes.DASHBOARD : Routes.LOGIN,
            getPages: AppPages.routes,
          );
        }
        return LoadingView();
      },
    );
  }
}
