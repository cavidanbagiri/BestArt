import 'package:flutter/material.dart';

import 'each_article_widget.dart';

class MainBodyWidgets extends StatelessWidget {
  const MainBodyWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.70,
      margin: const EdgeInsets.only(right: 15, left: 15),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 11,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return EachArticleWidget();

          //return Text('hello');
        },
      ),
    );
  }
}
