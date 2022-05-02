

import 'package:bestart/bindings/article_binding.dart';
import 'package:bestart/bindings/article_detail_bindings.dart';
import 'package:bestart/bindings/login_page_binding.dart';
import 'package:bestart/bindings/signup_page_binding.dart';
import 'package:bestart/routes/app_routes.dart';
import 'package:bestart/utils/layout_seperator.dart';
import 'package:bestart/views/desktop_body/article_detail_page.dart';
import 'package:bestart/views/desktop_body/home_page.dart';
import 'package:bestart/views/desktop_body/signup_page.dart';
import 'package:bestart/views/desktop_body/post_article_page.dart';
import 'package:get/get.dart';

import '../views/desktop_body/login_page.dart';

class RoutePages{
  static final pages = [
    GetPage(name: Routes.LAYOUT_SEPERATOR, page: ()=>LayoutSeperator()),
    GetPage(name: Routes.HOME, page: ()=>HomePage(), binding: ArticleBinding()),
    GetPage(name: Routes.LOGIN, page: ()=>LoginPage(), binding: LoginPageBindings()),
    GetPage(name: Routes.SIGNUP, page: ()=>SignUpPage(), binding: SignUpBinding()),
    GetPage(name: Routes.POSTARTICLEPAGE, page: ()=>PostArticlePage(), binding: ArticleBinding()),
    GetPage(name: Routes.ARTICLEDETAIL, page: ()=>ArticleDetail(), binding: ArticleDetailBinding()),
  ];
}
