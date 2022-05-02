import 'package:bestart/controller/article_controller.dart';
import 'package:bestart/controller/article_detail_controller.dart';
import 'package:bestart/models/article_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer_widget.dart';

class ArticleDetail extends GetView<ArticleDetailController> {
  ArticleDetail({Key? key, this.article_id}) : super(key: key);
  String? article_id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(),
        drawer: DrawerWidget(),
        body: FutureBuilder<Rx<ArticleModel?>>(
            future: controller.getArticleWithId(Get.arguments.toString()),
            builder: (context, snapshots){
              if(snapshots.hasError){
                final error = snapshots.error;
                print('error is ${error}');
                return Text('error');
              }
              if(snapshots.hasData){
                Rx<ArticleModel> data = snapshots.data as Rx<ArticleModel>;
                return Column(
                  children: [
                    Text('Create by me'),
                    Text('${data.value.title}'),
                    Text('${data.value.subject}'),
                    Obx(()=>Text('${controller.raiting_cont}'),),
                    IconButton(onPressed: (){
                      print('clicked up');
                      controller.vouteAppRaiting(data.value.id, data.value.raiting);
                    }, icon: Icon(Icons.arrow_upward)),
                    IconButton(onPressed: (){
                      print('clicked down');
                      controller.vouteDownRaiting(data.value.id, data.value.raiting);
                    }, icon: Icon(Icons.arrow_downward)),
                  ],
                );
              }
              else{
                print('value net');
                return const CircularProgressIndicator();
              }
            }
        ),
    );
  }
}
