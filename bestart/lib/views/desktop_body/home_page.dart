import 'package:bestart/controller/article_controller.dart';
import 'package:bestart/widgets/each_article_widget.dart';
import 'package:bestart/widgets/drawer_widget.dart';
import 'package:bestart/widgets/main_body_widgets.dart';
import 'package:bestart/widgets/post_article.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/appbar_widget.dart';

class HomePage extends GetView<ArticleController> {
  HomePage({Key? key}) : super(key: key);
  final controller = Get.put(ArticleController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      drawer: DrawerWidget(),
      body: Center(
          child: Container(
            child: SingleChildScrollView(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Main Side
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  PostArticle(),
                  MainBodyWidgets(),
                ],
              ),
              //Write Side
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  color: Colors.greenAccent,
                  height: MediaQuery.of(context).size.height,
                  margin: EdgeInsets.only(right: 10, top: 20),
                ),
              ),
            ],
        ),
      ),
          )),
    );
  }
}
