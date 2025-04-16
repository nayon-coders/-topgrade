import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/bottom_navigations/bottom_menus/views/bottom_menus_view.dart';
import 'package:kuwait_elearing/app/routes/app_pages.dart';
import 'package:kuwait_elearing/app/widgets/app_network_images.dart';
import 'package:kuwait_elearing/app/widgets/app_style.dart';
import 'package:kuwait_elearing/app/widgets/app_top_bar.dart';
import 'package:kuwait_elearing/app/widgets/default_page_layout.dart';
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
                child: Text(
                  "Engineering \nCourses",
                  textAlign: TextAlign.center,
                  style: normalText(
                      fontSize: 32,
                      fontColor: AppColor.primaryColor
                  ),
                ),
              ),
              SizedBox(height: 20,),
             Expanded(
               child: ListView.builder(
                 padding: EdgeInsets.zero,
                 itemCount: 10,
                 itemBuilder: (_, index){
                   return InkWell(
                     onTap: ()=>Get.toNamed(Routes.COURSES_COURSE_CONTENT),
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
                               child: AppNetworkImage(url: "https://s3-alpha-sig.figma.com/img/66fb/691f/4410c49ac1a23442c038219513610d35?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=oq0FbCGoSbuMqp5mO~PvoRGtsKzw73p~qSzQ-zuIIP9vVWnSDmRTTSjiJaNANJIl~TBBZdX~ebAGek-8lwW~yV6aHBlEQMlrE3v3l8NVrQb3pC0PmaPIjovu-sQwbHiGbKrKj6may~RCM-Y6KUlWAu0jg6HBTMPfDx8U6UOiopiTkd3u7JXOUJtgUok9Zg6nJRTYwS4TVU8-abpOwehI1Z3AfpMafauxQU2Rhof3TA78n7iZAyBMw48~njtIL3EmjdjosjLOmiVS0UxvhJK-XmB4BNvIR-cZschcDPmii-Yk56hn8KDovpwj0e1IAir~0h-0R7EkGKXOqwsgOiieVQ__",
                                 height: 80, weight: 80,
                               )),
                           SizedBox(width: 20,),
                           Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text("Mr. Mohammed",
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
