

import 'package:bestart/utils/dimensions.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  ResponsiveLayout({Key? key, required this.mobile_body, required this.desktop_body}) : super(key: key);

  final Widget mobile_body;
  final Widget desktop_body;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if(constraints.maxWidth<=mobile_width){
        return mobile_body;
      }
      else{
        return desktop_body;
      }
    });
  }
}

