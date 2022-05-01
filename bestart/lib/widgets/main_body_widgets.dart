import 'package:bestart/controller/article_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'each_article_widget.dart';

class MainBodyWidgets extends GetView<ArticleController> {
  const MainBodyWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      margin: const EdgeInsets.only(right: 15, left: 15),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: controller.article_model_list?.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return EachArticleWidget.write(
            controller.article_model_list?[index],
            index,
          );
        },
      ),
    );
  }
}
