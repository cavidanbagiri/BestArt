import 'package:bestart/routes/app_routes.dart';
import 'package:bestart/views/post_article_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostArticle extends StatelessWidget {
  PostArticle({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Get.put(PostArticleController());
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width * 0.70,
      height: 70,
      margin: const EdgeInsets.only(top: 20, bottom: 20, right: 10, left: 10),
      child: Row(
        children: [
          Container(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/img/first.jpg'),
            ),
            margin: const EdgeInsets.only(left: 10),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: InkWell(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Getting Article Page',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)),
                    labelText: 'Click For Writing Article',
                  ),
                  onTap: (){
                    Get.toNamed(Routes.POSTARTICLEPAGE);
                  },
                ),
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(right: 10, left: 10),
              child: Material(
                child: IconButton(
                  icon: const Icon(Icons.image),
                  onPressed: () async {
                    //Get.find<PostArticleController>().addArticles('Construction',
                    //  'How can we provide safety rules in Constuctionw');
                    // Get.find<PostArticleController>().getAllEmployees();
                    // print(Get.find<PostArticleController>()
                    //     .articles_model_list
                    //     .length);
                    //(Get.find<PostArticleController>().articles_model_list.length);
                  },
                ),
              )),
        ],
      ),
    );
  }
}
