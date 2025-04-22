import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuwait_elearing/app/modules/bottom_navigations/bottom_menus/views/bottom_menus_view.dart';
import 'package:kuwait_elearing/app/routes/app_pages.dart';
import 'package:kuwait_elearing/app/widgets/app_style.dart';
import 'package:kuwait_elearing/app/widgets/app_top_bar.dart';

import '../../../../../utility/app_color.dart';
import '../../../bottom_navigations/home/model/all_university_course_model.dart';
import '../controllers/courses_single_course_controller.dart';

class CoursesSingleCourseView extends GetView<CoursesSingleCourseController> {
   CoursesSingleCourseView({super.key});

  final SingleUniversityCourseItem data  = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          gradient: AppColor.primaryGradient,
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //app top bar
              AppTopBar(isBack: true, onBack: ()=>Get.back(),),
              Text(
                "${data.title}",
                style: normalText(
                  fontWeight: FontWeight.w700,
                  fontSize: 32,
                  fontColor: AppColor.primaryColor
                ),
              ),
              SizedBox(height: 30,),
              InkWell(
                onTap: ()=>Get.toNamed(Routes.COURSES_SUBMIT_ASSIGNMENT,  arguments: Get.arguments),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text("Assignment solving",
                      style: normalText(
                          fontWeight: FontWeight.w700,
                          fontSize: 20
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: ()=>Get.toNamed(Routes.COURSES_COURCE_TOPICS, arguments: Get.arguments),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text("Online Courses",
                      style: normalText(
                          fontWeight: FontWeight.w700,
                          fontSize: 20
                      ),
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
      bottomNavigationBar: AppBottomMenu(),
    );
  }
}
