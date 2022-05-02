import 'package:bestart/controller/article_controller.dart';
import 'package:bestart/routes/app_routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/article_detail_controller.dart';

class EachArticleWidget extends GetView<ArticleController> {
  EachArticleWidget({Key? key}) : super(key: key);
  EachArticleWidget.write(this.model, this.index);
  var model;
  int? index;
  String getDateTime(DateTime t){
    final DateFormat format = DateFormat('yyyy-MM-dd');
    String formatted = format.format(t);
    return formatted;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: InkWell(
          onTap: () {
            Get.toNamed(Routes.ARTICLEDETAIL, arguments: model?.id);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Yes Or Not Section
              Container(
                margin: const EdgeInsets.only(left: 5),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(250, 250, 250, 1),
                ),
                child: Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          controller.vouteAppRaiting(
                              model?.id, model!.raiting.length);
                        },
                        icon: const Icon(Icons.arrow_upward)),
                    Obx(()=>Text('${controller.article_model_list![index!].raiting!.length}')),
                    IconButton(
                        onPressed: () {
                          controller.vouteDownRaiting(
                              model?.id, model!.raiting.length);
                        },
                        icon: const Icon(Icons.arrow_downward)),
                  ],
                ),
              ),
              //Image Section
              Container(
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: 80,
                    width: 100,
                    color: const Color.fromRGBO(250, 250, 250, 1),
                    child: const Icon(
                      Icons.image,
                      size: 35,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              //Information Section
              Container(
                height: 100,
                margin: const EdgeInsets.only(left: 20),
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Article Name Section
                    Expanded(
                      child: Container(
                          child: Text(
                        '${model?.title}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      )),
                    ),
                    //User Information Section
                    Expanded(
                      child: Container(
                        child: Text(
                          'Posted By ${model?.email}      Posted Time : ${getDateTime(model?.time.toDate())} ',
                          style: const TextStyle(
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ),
                    //Other Section
                    Expanded(
                      child: Row(
                        children: [
                          //Comment
                          Container(
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.comment,
                                  size: 20,
                                ),
                                Text(
                                  'Comment',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //Share
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.share,
                                  size: 20,
                                ),
                                Text(
                                  'Share',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //Download
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.download,
                                  size: 20,
                                ),
                                Text(
                                  'Download',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //Read
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Row(
                              children: const [
                                Icon(Icons.read_more),
                                Text(
                                  'Read',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
