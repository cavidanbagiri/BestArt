import 'package:bestart/controller/article_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/appbar_widget.dart';
import '../widgets/drawer_widget.dart';

class PostArticlePage extends GetView<ArticleController> {
  PostArticlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      drawer: DrawerWidget(),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 100,
              child: TextField(
                decoration: InputDecoration(hintText: 'Title'),
                controller: controller.title_controller,
              ),
            ),
            Container(
              height: 300,
              child: TextField(
                decoration:
                    InputDecoration(hintText: 'Write An Article Subject'),
                controller: controller.subject_controller,
              ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  controller.addArticle(
                      controller.title_controller!.text,
                      controller.subject_controller!.text,
                      controller.current_user.read('email'));
                },
                child: Text('Post'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
