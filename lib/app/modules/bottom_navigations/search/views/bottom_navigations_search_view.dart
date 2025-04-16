import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kuwait_elearing/app/widgets/app_top_bar.dart';
import 'package:kuwait_elearing/app/widgets/default_page_layout.dart';
import 'package:kuwait_elearing/utility/app_color.dart';

import '../controllers/bottom_navigations_search_controller.dart';

class BottomNavigationsSearchView
    extends GetView<BottomNavigationsSearchController> {
  const BottomNavigationsSearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultPageLayout(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTopBar(
                isBack: true,
                onBack: ()=>Get.back(),
                isShowCart: false,
              ),

              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,
                  color: Colors.black,
                    size: 30,
                  ),
                  hintText: "Search",
                  border: UnderlineInputBorder(), // default bottom border
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColor.primaryColor), // customize color
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColor.primaryColor, width: 1), // on focus
                  ),
                ),

              )
            ],
          ),
        ),
      )
    );
  }
}
