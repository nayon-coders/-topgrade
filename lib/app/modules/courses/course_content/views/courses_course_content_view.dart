import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/bottom_navigations/bottom_menus/views/bottom_menus_view.dart';
import 'package:kuwait_elearing/app/modules/cart/controllers/cart_controller.dart';
import 'package:kuwait_elearing/app/routes/app_pages.dart';
import 'package:kuwait_elearing/app/widgets/app_style.dart';
import 'package:kuwait_elearing/app/widgets/app_top_bar.dart';
import 'package:kuwait_elearing/app/widgets/default_page_layout.dart';
import 'package:kuwait_elearing/app/widgets/nodata_found.dart';
import 'package:kuwait_elearing/utility/app_color.dart';

import '../../course_video_overview/controllers/courses_course_video_overview_controller.dart';
import '../controllers/courses_course_content_controller.dart';

class CoursesCourseContentView extends GetView<CoursesCourseContentController> {
  const CoursesCourseContentView({super.key});
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
              ),
              Center(
                child: Text("Content",
                  textAlign: TextAlign.center,
                  style: normalText(
                    fontSize: 32,
                    fontColor: AppColor.primaryColor
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() {
                      return InkWell(
                        onTap: (){
                          if(controller.isPackage.value){
                            controller.changePackage(false);
                          } else
                            return;
                        },
                        child: Container(
                          width: 120,
                          height: 35,
                          decoration: BoxDecoration(
                            color: controller.isPackage.value == false? AppColor.primaryColor : Color(0xffACACAC),
                            borderRadius: BorderRadius.circular(100)
                          ),
                          child: Center(
                            child: Text("Semester",
                              style: normalText(
                                fontSize: 14,
                                fontColor: controller.isPackage.value ? AppColor.primaryColor : Color(0xffACACAC),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  ),
                  Obx((){
                      return InkWell(
                        onTap: (){
                          if(controller.isPackage.value == false){
                            controller.changePackage(true);
                          } else
                            return;
                        },
                        child: Container(
                          width: 120,
                          height: 35,
                          decoration: BoxDecoration(
                              color: controller.isPackage.value ? AppColor.primaryColor : Color(0xffACACAC),
                              borderRadius: BorderRadius.circular(100)
                          ),
                          child: Center(
                            child: Text("Packages",
                              style: normalText(
                                  fontSize: 14,
                                fontColor: controller.isPackage.value ? Color(0xffACACAC) :  AppColor.primaryColor,

                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  )
                ],
              ),
              SizedBox(height: 20,),
              Obx((){
                return controller.isPackage.value
                    ? PackageContent()
                    : SemesterContent();
              })
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppBottomMenu(),
    );
  }
}



class PackageContent extends GetView<CoursesCourseContentController> {
  const PackageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
          return controller.isLoading.value
              ? Center(child: CircularProgressIndicator.adaptive(backgroundColor: AppColor.white,),)
              : controller.singleCourseDetailsModel.value.data == null
              ? SizedBox(height: 40, child: NoDataFound(),)
              : ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: controller.singleCourseDetailsModel.value.data!.packages!.length,
                itemBuilder: (_, index){
                  var data = controller.singleCourseDetailsModel.value.data!.packages![index];
                  return InkWell(
                    onTap: (){
                      Get.toNamed(Routes.COURSES_COURSE_VIDEO_OVERVIEW, arguments: {"package" : data, "teacher" : controller.singleCourseDetailsModel.value.data!.teacher});
                    },
                    //onTap: ()=>,
                    child: Container(
                      height: 100,
                      width: Get.width,
                      padding: EdgeInsets.only(
                          left: 30, right: 30, top: 15, bottom: 15
                      ),
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(100)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${data.title}",
                            style: normalText(
                              fontSize: 14,
                            ),
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${data.price} KD",
                                style: normalText(
                                  fontSize: 14,
                                ),
                              ),

                              Container(
                                width: 100,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Color(0xffA3850D),
                                    borderRadius: BorderRadius.circular(100)
                                ),
                                child: Center(
                                  child: Text("Add to cart",
                                    style: normalText(
                                        fontSize: 14
                                    ),
                                  ),
                                ),
                              )

                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
        }
      ),
    );
  }
}


class SemesterContent extends GetView<CoursesCourseContentController> {
  const SemesterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var data = controller.singleCourseDetailsModel.value.data!.semester!;
      return InkWell(
        onTap: (){
          Get.toNamed(Routes.COURSES_COURSE_VIDEO_OVERVIEW, arguments: {"semester" : data, "teacher" : controller.singleCourseDetailsModel.value.data!.teacher});
        },
        child: Container(
            padding: EdgeInsets.all(20),
            height: 300,
            width: Get.width,
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(50)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.title!,
                  style: normalText(
                      fontSize: 14
                  ),
                ),
                SizedBox(height: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: data.chapter!.map((value){
                    return Row(
                      children: [
                        Container(
                          width: 4, height: 4, decoration: BoxDecoration(color: AppColor.white,borderRadius: BorderRadius.circular(100)),
                        ),
                        SizedBox(width: 8,),
                        Text(value.chapterName!,
                          style: normalText(
                              fontSize: 14
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${double.parse("${data.price}").toStringAsFixed(2)} KD",
                      style: normalText(
                        fontSize: 14,
                      ),
                    ),

                    InkWell(
                      onTap: (){
                      },
                      child: Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Color(0xffA3850D),
                            borderRadius: BorderRadius.circular(100)
                        ),
                        child: Center(
                          child: Text("Add to cart",
                            style: normalText(
                                fontSize: 14
                            ),
                          ),
                        ),
                      ),
                    )

                  ],
                ),

              ],
            ),
          ),
      );
      }
    );
  }
}




