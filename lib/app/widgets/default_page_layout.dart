import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utility/app_color.dart';
class DefaultPageLayout extends StatelessWidget {
  const DefaultPageLayout({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      padding: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        gradient: AppColor.primaryGradient,
      ),
      child: child,
    );
  }
}
