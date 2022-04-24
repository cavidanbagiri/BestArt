
import 'package:bestart/routes/app_routes.dart';
import 'package:bestart/routes/route_pages.dart';
import 'package:bestart/views/desktop_body/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


void main() {

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

