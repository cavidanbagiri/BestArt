

import 'package:bestart/routes/app_routes.dart';
import 'package:bestart/utils/layout_seperator.dart';
import 'package:bestart/views/desktop_body/home_page.dart';
import 'package:get/get.dart';

import '../views/desktop_body/login_page.dart';

class RoutePages{
  static final pages = [
    GetPage(name: Routes.LAYOUT_SEPERATOR, page: ()=>LayoutSeperator()),
    GetPage(name: Routes.HOME, page: ()=>HomePage()),
    GetPage(name: Routes.LOGIN, page: ()=>LoginPage()),
  ];
}
