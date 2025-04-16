import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../utility/app_color.dart';
import '../../../../routes/app_pages.dart';
import '../../../../widgets/app_style.dart';
import '../../../../widgets/app_top_bar.dart';
import '../../../bottom_navigations/bottom_menus/views/bottom_menus_view.dart';
import '../controllers/student_single_course_controller.dart';

class StudentSingleCourseView extends GetView<StudentSingleCourseController> {
  const StudentSingleCourseView({super.key});
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
                "Science",
                style: normalText(
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                    fontColor: AppColor.primaryColor
                ),
              ),
              SizedBox(height: 30,),
              InkWell(
                onTap: ()=>Get.toNamed(Routes.STUDENT_HOME_TUTORING),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text("Home tutoring",
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
                onTap: ()=>Get.toNamed(Routes.STUDENT_STUDY_NOTE),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text("Study Notes",
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
