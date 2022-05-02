import 'package:bestart/controller/article_controller.dart';
import 'package:bestart/controller/article_detail_controller.dart';
import 'package:bestart/models/article_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer_widget.dart';

class ArticleDetail extends StatefulWidget {
  ArticleDetail({Key? key, this.article_id}) : super(key: key);
  String? article_id;

  @override
  State<ArticleDetail> createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  var controller = Get.put(ArticleDetailController());

  late Future<Rx<ArticleModel>> dataFuture = controller.getArticleWithId(Get.arguments.toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(),
        drawer: DrawerWidget(),
        body: FutureBuilder<Rx<ArticleModel?>>(
            //future: controller.getArticleWithId(Get.arguments.toString()),
            future: dataFuture,
            builder: (context, snapshots){
              if(snapshots.hasError){
                final error = snapshots.error;
                print('error is ${error}');
                return Text('error');
              }
              if(snapshots.hasData){
                var data = snapshots.data as Rx<ArticleModel>;
                print('bura girdi');
                return Column(
                  children: [
                    Text('Create by me'),
                    Text('${data.value.title}'),
                    Text('${data.value.subject}'),
                    //Obx(()=>Text('${controller.raiting_cont}'),),
                    Obx(()=>Text('${data.value.raiting}'),),
                    IconButton(onPressed: (){
                      print('clicked up');
                      controller.vouteAppRaiting(data.value.id, data.value.raiting);
                      setState(() {
                        dataFuture = controller.getArticleWithId(Get.arguments.toString());
                      });
                      //dataFuture = controller.dataFutureMethod(data.value.id.toString(), data);
                      //dataFuture = data.
                      //data.value.raiting = data.value.raiting+1;
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
