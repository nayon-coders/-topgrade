import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/bottom_navigations/bottom_menus/views/bottom_menus_view.dart';
import 'package:kuwait_elearing/app/routes/app_pages.dart';
import 'package:kuwait_elearing/app/widgets/app_network_images.dart';
import 'package:kuwait_elearing/app/widgets/app_style.dart';
import 'package:kuwait_elearing/app/widgets/app_top_bar.dart';
import 'package:kuwait_elearing/app/widgets/default_page_layout.dart';
import 'package:kuwait_elearing/app/widgets/nodata_found.dart';
import 'package:kuwait_elearing/utility/app_color.dart';

import '../controllers/courses_single_course_instractor_controller.dart';

class CoursesSingleCourseInstractorView
    extends GetView<CoursesSingleCourseInstractorController> {
  const CoursesSingleCourseInstractorView({super.key});
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

              SizedBox(height: 10,),
              Center(
                child: Obx(() {
                    return controller.teacherListModel.value.data == null ? SizedBox(
                      height: 35,
                    ): Text(
                      "${controller.teacherListModel.value.data!.name}",
                      textAlign: TextAlign.center,
                      style: normalText(
                          fontSize: 32,
                          fontColor: AppColor.primaryColor
                      ),
                    );
                  }
                ),
              ),
              SizedBox(height: 20,),
             Expanded(
               child: Obx(() {
                   return controller.isLoading.value || controller.teacherListModel.value.data == null
                       ? Center(
                         child: CircularProgressIndicator.adaptive(backgroundColor: AppColor.white,),
                       ) :  controller.teacherListModel.value.data!.teachers!.isEmpty
                       ? SizedBox(
                         height: 400,
                         child: Center(
                           child: NoDataFound(),
                         ),
                       )
                       : ListView.builder(
                     padding: EdgeInsets.zero,
                     itemCount: controller.teacherListModel.value.data!.teachers!.length,
                     itemBuilder: (_, index){
                       var data = controller.teacherListModel.value.data!.teachers![index];
                       return InkWell(
                         onTap: (){
                           controller.selectedTeacherId = data.teacherId.toString();
                           Get.toNamed(Routes.COURSES_COURSE_CONTENT);
                         },
                         child: Container(
                           width: Get.width,
                           height: 120,
                           padding: EdgeInsets.all(20),
                           margin: EdgeInsets.only(bottom: 20),
                           decoration: BoxDecoration(
                             color: AppColor.primaryColor,
                             borderRadius: BorderRadius.circular(100),
                           ),
                           child: Row(
                             children: [
                               ClipRRect(
                                   borderRadius: BorderRadius.circular(100),
                                   child: AppNetworkImage(url: "${data.profilePic ?? ""}",
                                     height: 80, weight: 80,
                                   )),
                               SizedBox(width: 20,),
                               Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text("${data.firstName} ${data.lastName}",
                                     style: normalText(
                                         fontSize: 14
                                     ),
                                   ),
                                   SizedBox(height: 8,),
                                   Text("(543) 4.5 ★",
                                     style: normalText(
                                         fontSize: 14
                                     ),
                                   ),
                                   Spacer(),
                                   Text("Videos: (10:20 H and 45 Chapter)",
                                     style: normalText(
                                         fontSize: 12
                                     ),
                                   ),

                                 ],
                               )
                             ],

                           ),
                         ),
                       );
                     },
                   );
                 }
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
