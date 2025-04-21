import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kuwait_elearing/app/routes/app_pages.dart';
import 'package:kuwait_elearing/app/widgets/app_network_images.dart';
import 'package:kuwait_elearing/app/widgets/app_style.dart';
import 'package:kuwait_elearing/app/widgets/app_top_bar.dart';
import 'package:kuwait_elearing/app/widgets/nodata_found.dart';
import 'package:kuwait_elearing/utility/app_color.dart';

import '../../../../widgets/default_page_layout.dart';
import '../controllers/bottom_navigations_my_orders_controller.dart';

class BottomNavigationsMyOrdersView
    extends GetView<BottomNavigationsMyOrdersController> {
  const BottomNavigationsMyOrdersView({super.key});
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
                isBack: false,
              ),
              Text("My Order",
                style: normalText(fontSize: 32, fontColor: AppColor.primaryColor),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      if(controller.isAssignment.value == false){
                        controller.changeTab(true);
                      }
                    },
                    child: SizedBox(
                      width: 150,
                      height: 40,
                      child: Stack(
                        children: [
                          Obx(() {
                              return Container(
                                width: 150,
                               height: 40,
                                //padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: controller.isAssignment.value ? AppColor.primaryColor : AppColor.white,
                                  borderRadius: BorderRadius.circular(100)
                                ),
                                child: Center(
                                  child: Text("Assignment",
                                    style: normalText(
                                      fontColor: controller.isAssignment.value ? AppColor.white : AppColor.primaryColor
                                    ),
                                  ),
                                ),
                              );
                            }
                          ),
                          Positioned(
                            right: 15, top:0,
                            child: Container(
                              width: 20,
                              height:20,
                              decoration: BoxDecoration(
                                  color: AppColor.secounderyColor,
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              child: Center(
                                child: Obx((){
                                    return Text("${controller.myAssignmentOrderListModel.value.length}",
                                    style: normalText(
                                      fontSize: 10, fontColor: AppColor.white
                                    ),
                                    );
                                  }
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      if(controller.isAssignment.value){
                        controller.changeTab(false);
                      }
                    },
                    child: SizedBox(
                      width: 150,
                      height: 40,
                      child: Stack(
                        children: [
                          Obx(() {
                              return Container(
                                width: 150,
                                height: 40,
                                //padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: controller.isAssignment.value ? AppColor.white : AppColor.primaryColor,
                                    borderRadius: BorderRadius.circular(100)
                                ),
                                child: Center(
                                  child: Text("Courses",
                                    style: normalText(
                                      fontColor: controller.isAssignment.value ? AppColor.primaryColor : AppColor.white
                                    ),
                                  ),
                                ),
                              );
                            }
                          ),
                          Positioned(
                            right: 15, top:0,
                            child: Container(
                              width: 20,
                              height:20,
                              decoration: BoxDecoration(
                                  color: AppColor.secounderyColor,
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              child: Center(
                                child: Obx(() {
                                    return Text("${controller.myCourseOrderListModel.value.data!.length}",
                                      style: normalText(
                                          fontSize: 10, fontColor: AppColor.white
                                      ),
                                    );
                                  }
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(height: 20,),
              Obx(() {
                  return controller.isAssignment.value
                      ? AssignmentList()
                      : CoursesList();
                }
              )
            ],
          ),
        )
      )
    );
  }
}

class AssignmentList extends GetView<BottomNavigationsMyOrdersController> {
  const AssignmentList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // return Obx(() {
    //     return Expanded(
    //       child: ListView.builder(
    //         padding: EdgeInsets.zero,
    //         itemCount: controller.myAssignmentOrderListModel.value.length,
    //         itemBuilder: (_, index){
    //           var data =  controller.myAssignmentOrderListModel.value[index];
    //           return InkWell(
    //             onTap: ()=>data.type == "course"
    //                 ? Get.toNamed(Routes.COURSE_ORDER_DETAILS)
    //                 : Get.toNamed(Routes.ASSIGNMENT_ORDER_DETAILS),
    //             child: Container(
    //               width: Get.width,
    //               padding: EdgeInsets.all(20),
    //               margin: EdgeInsets.only(bottom: 10),
    //               decoration: BoxDecoration(
    //                 color: AppColor.primaryColor,
    //                 borderRadius: BorderRadius.circular(100)
    //               ),
    //               child: Row(
    //                 children: [
    //                   SizedBox(
    //                     width: 60,
    //                     height: 60,
    //                     child: ClipRRect(
    //                       borderRadius: BorderRadius.circular(100),
    //                       child: AppNetworkImage(url: "${data.image}",
    //                         fit: BoxFit.cover,
    //                       ),
    //                     ),
    //                   ),
    //                   SizedBox(width: 5,),
    //                   SizedBox(
    //                     width: 100,
    //                     child: Center(
    //                       child: Text("${data.engineering}",
    //                         textAlign: TextAlign.center,
    //                         style: normalText(
    //                           fontSize: 14
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                   SizedBox(width: 5,),
    //                   Expanded(
    //                     child: Column(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Text("Assignment: ${data.assignment} ",
    //                           textAlign: TextAlign.center,
    //                           style: normalText(
    //                             fontSize: 13
    //                           ),
    //                         ),
    //                         Text("Date: ${data.date}",
    //                           textAlign: TextAlign.center,
    //                           style: normalText(
    //                               fontSize: 13
    //                           ),
    //                         ),
    //                         Text("Order #${data.order}",
    //                           textAlign: TextAlign.center,
    //                           style: normalText(
    //                               fontSize: 13
    //                           ),
    //                         ),
    //                         Text("Status: ${data.status} ",
    //                           textAlign: TextAlign.center,
    //                           style: normalText(
    //                               fontSize: 13
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           );
    //         },
    //       ),
    //     );
    //   }
    // );
    return Center();
  }
}


class CoursesList extends GetView<BottomNavigationsMyOrdersController> {
  const CoursesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isLoading.value
          ? Center(child: CircularProgressIndicator.adaptive(backgroundColor: AppColor.white,),)
          : controller.myCourseOrderListModel.value.data == null || controller.myCourseOrderListModel.value.data!.isEmpty
          ? SizedBox(height: 400, child: NoDataFound(),)
          : Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: controller.myCourseOrderListModel.value.data!.length,
              itemBuilder: (_, index){
                var data =  controller.myCourseOrderListModel.value.data![index];
                return InkWell(
                  onTap: ()=>Get.toNamed(Routes.COURSE_ORDER_DETAILS),
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
                            child: AppNetworkImage(url: "${data.status}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        SizedBox(
                          width: 100,
                          child: Center(
                            child: Text("${data.status}",
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
                              Text("${data.id}",
                                textAlign: TextAlign.center,
                                style: normalText(
                                    fontSize: 13
                                ),
                              ),
                              Text("Date: ${data.updatedAt}",
                                textAlign: TextAlign.center,
                                style: normalText(
                                    fontSize: 13
                                ),
                              ),
                              Text("Order #${data.couponCode}",
                                textAlign: TextAlign.center,
                                style: normalText(
                                    fontSize: 13
                                ),
                              ),
                              Text("Status: ${data.status} ",
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
            ),
      );
    }
    );
  }
}

