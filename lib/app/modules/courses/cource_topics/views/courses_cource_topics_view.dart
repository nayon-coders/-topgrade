import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/bottom_navigations/bottom_menus/views/bottom_menus_view.dart';
import 'package:kuwait_elearing/app/routes/app_pages.dart';
import 'package:kuwait_elearing/app/widgets/app_style.dart';
import 'package:kuwait_elearing/app/widgets/app_top_bar.dart';

import '../../../../../utility/app_color.dart';
import '../../../../widgets/nodata_found.dart';
import '../controllers/courses_cource_topics_controller.dart';

class CoursesCourceTopicsView extends GetView<CoursesCourceTopicsController> {
  const CoursesCourceTopicsView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getCourseTopics(Get.arguments); // Fetch topics with course ID
    });
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          gradient: AppColor.primaryGradient,
          ),
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
                child: Text("Engineering\nCourse",
                  textAlign: TextAlign.center,
                  style: normalText(
                    fontSize: 32,
                    fontColor: AppColor.primaryColor
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Expanded(
                child: Obx(() {
                    return controller.isLoading.value ? Center(child: CircularProgressIndicator.adaptive(backgroundColor: AppColor.white,),)
                        : controller.topicsModel.value.data != null && controller.topicsModel.value.data!.courseTopic!.isEmpty
                        ? SizedBox(
                            height: 400,
                      child: NoDataFound() ):GridView.count(
                          primary: false,
                          padding: const EdgeInsets.all(20),
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          crossAxisCount: 2,
                          children: controller.topicsModel.value.data!.courseTopic!.map((data){
                            return InkWell(
                              onTap: ()=>Get.toNamed(Routes.COURSES_SINGLE_COURSE_INSTRACTOR),
                              child: Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  color: AppColor.primaryColor,
                                  borderRadius: BorderRadius.circular(100)
                                ),
                                child: Center(
                                  child: Text("${data.name}",
                                    style: normalText(),
                                  ),
                                ),
                              ),
                            );
                          }).toList()
                        );
                  }
                ),
              )
            ],
          ),
        )
      ),
      bottomNavigationBar: AppBottomMenu(),
    );
  }
}

