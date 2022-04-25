
import 'package:bestart/controller/login_page_controller.dart';
import 'package:bestart/routes/app_routes.dart';
import 'package:bestart/routes/route_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCFMlahP3IR0vGff-OFrqECPABB5WHM6Uk",
          authDomain: "first-getx-app.firebaseapp.com",
          projectId: "first-getx-app",
          storageBucket: "first-getx-app.appspot.com",
          messagingSenderId: "900359479800",
          appId: "1:900359479800:web:2258a3fe64b332298f760d")
  ).then((value) => LoginPageController());
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: RoutePages.pages,
      initialRoute: Routes.LAYOUT_SEPERATOR,
    );
  }
}

