import 'package:bestart/controller/article_controller.dart';
import 'package:bestart/controller/article_detail_controller.dart';
import 'package:bestart/models/article_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer_widget.dart';

class ArticleDetail extends GetView<ArticleDetailController> {

  ArticleDetail({Key? key, this.article_id}) : super(key: key);
  String ? article_id;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBarWidget(),
      drawer: DrawerWidget(),
      body:FutureBuilder<ArticleModel?>(
        future: controller.getArticleWithId(Get.arguments.toString()),
        builder: (context, snapshots){
          if(snapshots.hasData){
            ArticleModel data = snapshots.data as ArticleModel;
            return Column(
              children: [
                Text('${data.title}'),
                Text('${data.subject}'),
              ],
            );
          }
          else{
            return const CircularProgressIndicator();
          }
        }
      ),
    );
  }
}
