import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kuwait_elearing/app/widgets/app_input.dart';
import 'package:kuwait_elearing/app/widgets/app_network_images.dart';
import 'package:kuwait_elearing/app/widgets/app_style.dart';
import 'package:kuwait_elearing/app/widgets/app_top_bar.dart';
import 'package:kuwait_elearing/app/widgets/default_page_layout.dart';
import 'package:kuwait_elearing/utility/app_color.dart';

import '../../../../routes/app_pages.dart';
import '../controllers/teacher_panel_my_order_controller.dart';

class TeacherPanelMyOrderView extends GetView<TeacherPanelMyOrderController> {
  const TeacherPanelMyOrderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: DefaultPageLayout(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTopBar(isShowCart: false,),
              Text("My Orders",
                style: normalText(
                  fontSize: 36,
                  fontColor: AppColor.primaryColor
                ),
              ),
              SizedBox(height: 10,),
              Expanded(child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 10,
                itemBuilder: (_, index){
                  return InkWell(
                    onTap: ()=>Get.toNamed(Routes.TEACHER_PANEL_ORDER_DETAILS),
                    child: Container(
                      width: Get.width,
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(100)
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: AppNetworkImage(url: "",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 5,),
                          SizedBox(
                            width: 100,
                            child: Center(
                              child: Text("High School: Math",
                                textAlign: TextAlign.center,
                                style: normalText(
                                    fontSize: 14
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5,),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Assignment: Homework ",
                                  textAlign: TextAlign.center,
                                  style: normalText(
                                      fontSize: 13
                                  ),
                                ),
                                Text("Date: 12/2/2025",
                                  textAlign: TextAlign.center,
                                  style: normalText(
                                      fontSize: 13
                                  ),
                                ),
                                Text("Order #345233",
                                  textAlign: TextAlign.center,
                                  style: normalText(
                                      fontSize: 13
                                  ),
                                ),
                                Text("Status: Pending",
                                  textAlign: TextAlign.center,
                                  style: normalText(
                                      fontSize: 13
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ))

            ],
          ),
        ),
      )
    );
  }
}
