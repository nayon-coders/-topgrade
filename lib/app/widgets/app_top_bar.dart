import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuwait_elearing/app/routes/app_pages.dart';

import '../../utility/app_assets.dart';
import '../../utility/app_color.dart';


class AppTopBar extends StatelessWidget {
  const AppTopBar({
    super.key,
    this.isBack = false,
    this.onBack,
    this.isShowCart = true
  });
  final bool isBack;
  final VoidCallback? onBack;
  final bool isShowCart;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(child: Image.asset(AppAssets.logo, height: 150, fit:  BoxFit.fill,)),
        Visibility(
          visible: isShowCart,
          child: Positioned(
            right: 0,
            top: 10,
            child: IconButton(
              onPressed: ()=>Get.toNamed(Routes.CART),
              icon: Icon(Icons.shopping_basket_rounded, color: AppColor.white, size: 30,),
            ),
          ),
        ),
        Visibility(
          visible: isBack,
          child: Positioned(
            left: 0,
            top: 10,
            child: IconButton(
              onPressed: onBack,
              icon: Icon(Icons.arrow_back, color: AppColor.white, size: 30,),
            ),
          ),
        )
      ],
    );
  }
}