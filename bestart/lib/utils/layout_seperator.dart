

import 'package:bestart/responsive/mobile_body.dart';
import 'package:bestart/responsive/responsive_layout.dart';
import 'package:bestart/views/desktop_body/home_page.dart';
import 'package:flutter/material.dart';

class LayoutSeperator extends StatelessWidget {
  const LayoutSeperator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobile_body: MobileBody(),
        desktop_body: HomePage(),
      ),
    );
  }
}
