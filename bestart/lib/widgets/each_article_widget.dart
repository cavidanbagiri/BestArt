import 'package:flutter/material.dart';

class EachArticleWidget extends StatelessWidget {
  EachArticleWidget({Key? key}) : super(key: key);
  String user_name = "Cavidan Baghirli";
  String article_name = "How Can You Use Dart Programming Language Corretly";
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top:10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: InkWell(
          onTap: (){},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Yes Or Not Section
              Container(
                margin: EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(250, 250, 250, 1),
                ),
                child: Column(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_upward)),
                    Text('12'),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_downward)),
                  ],
                ),
              ),
              //Image Section
              Container(
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    height: 80,
                    width: 100,
                    color: Color.fromRGBO(250, 250, 250, 1),
                    child: Icon(
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
                margin: EdgeInsets.only(left: 20),
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Article Name Section
                    Expanded(
                      child: Container(
                          child: Text(
                            '${article_name}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          )),
                    ),
                    //User Information Section
                    Expanded(
                      child: Container(
                        child: Text(
                          'Posted By ${user_name}      Posted Time : 16.03.2022 ',
                          style: TextStyle(
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
                              children: [
                                Icon(Icons.comment, size: 20,),
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
                            margin: EdgeInsets.only(left:10),
                            child: Row(
                              children: [
                                Icon(Icons.share,  size: 20,),
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
                            margin: EdgeInsets.only(left:10),
                            child: Row(
                              children: [
                                Icon(Icons.download,  size: 20,),
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
                            margin: EdgeInsets.only(left:10),
                            child: Row(
                              children: [
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
