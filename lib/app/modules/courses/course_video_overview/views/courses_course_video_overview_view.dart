import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kuwait_elearing/app/widgets/app_style.dart';
import 'package:kuwait_elearing/app/widgets/app_top_bar.dart';
import 'package:kuwait_elearing/app/widgets/default_page_layout.dart';
import 'package:kuwait_elearing/utility/app_color.dart';

import '../controllers/courses_course_video_overview_controller.dart';

class CoursesCourseVideoOverviewView
    extends GetView<CoursesCourseVideoOverviewController> {
  const CoursesCourseVideoOverviewView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultPageLayout(
        child: SingleChildScrollView(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             SizedBox(height: 10,),
             AppTopBar(
               isBack: true,
               onBack: ()=>Get.back(),
             ),
             //video section
             Container(
               height: 200,
               width: Get.width,
               decoration: BoxDecoration(
                 color: Colors.black,
               ),
               child: Center(
                 child: Icon(
                   Icons.play_arrow, color: Colors.white, size: 50,
                 ),
               ),
             ),

             Padding(
               padding: const EdgeInsets.all(10.0),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("Physics 101 Chapter 1",
                    style: normalText(
                      fontSize: 16,
                      fontColor: AppColor.primaryColor
                    ),
                   ),
                   SizedBox(height: 5,),
                   Text("By Eng. Ahmad",
                     style: normalText(
                         fontSize: 16,
                         fontColor: AppColor.primaryColor
                     ),
                   ),
                   SizedBox(height: 8,),
                   Divider(height: 1, color: Colors.black,),
                   SizedBox(height: 8,),
                   Row(
                     children: [
                       Icon(Icons.video_camera_back_outlined, color: Colors.black, size: 20,),
                       SizedBox(width: 5,),
                       Text("Lessons",
                        style: normalText(
                          fontSize: 16,
                          fontColor: Colors.black
                        ),
                       )
                     ],
                   ),
                   SizedBox(height: 5,),
                   Row(
                     children: [
                       Icon(Icons.watch_later_outlined, color: Colors.black, size: 20,),
                       SizedBox(width: 5,),
                       Text("3 Hrs 42 Min",
                        style: normalText(
                          fontSize: 16,
                          fontColor: Colors.black
                        ),
                       )
                     ],
                   ),
                   SizedBox(height: 10,),
                   Text("Videos",
                    style: normalText(
                      fontSize: 16,
                      fontColor: AppColor.black
                    ),
                   ),
                   SizedBox(height: 10,),
                   Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [1,1,1,1,1].map((data){
                       return Container(
                         height: 80,
                         padding: EdgeInsets.all(10),
                         margin: EdgeInsets.only(bottom: 10),
                         width: Get.width,
                         decoration: BoxDecoration(
                           color: AppColor.primaryColor,
                           borderRadius: BorderRadius.circular(10)
                         ),
                         child: Row(
                           children: [
                             Container(
                               width: 80,
                               height: 80,
                               decoration: BoxDecoration(
                                 color: Colors.black
                               ),
                               child: Center(
                                 child: Icon(Icons.play_arrow, color: Colors.white, size: 40,),
                               ),
                             ),
                             SizedBox(width: 10,),
                             Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("Part A",
                                  style: normalText(
                                    fontSize: 16
                                  ),
                                 ),
                                 SizedBox(height: 5,),
                                 Text("00:30:00",
                                   style: normalText(
                                       fontSize: 16
                                   ),
                                 )
                               ],
                             )
                           ],
                         ),
                       );
                     }).toList(),
                   )

                 ],
               ),
             )
           ],
         ),

        ),
      )
    );
  }
}
