import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/bottom_navigations/bottom_menus/views/bottom_menus_view.dart';
import 'package:kuwait_elearing/app/widgets/app_button.dart';
import 'package:kuwait_elearing/app/widgets/app_input.dart';
import 'package:kuwait_elearing/app/widgets/app_style.dart';
import 'package:kuwait_elearing/app/widgets/custome_dropdown.dart';
import 'package:kuwait_elearing/utility/app_json.dart';

import '../../../../../utility/app_assets.dart';
import '../../../../../utility/app_color.dart';
import '../controllers/courses_submit_assignment_controller.dart';

class CoursesSubmitAssignmentView
    extends GetView<CoursesSubmitAssignmentController> {
  const CoursesSubmitAssignmentView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.only(top: 60),
        decoration: BoxDecoration(
          gradient: AppColor.primaryGradient,
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //app top bar
              Stack(
                children: [
                  Image.asset(AppAssets.logo, height: 140,  width: Get.width, fit: BoxFit.cover,),
                  Positioned(
                    top: 0,
                    left: 10,
                    child: IconButton(
                      onPressed: ()=>Get.back(),
                      icon: Icon(Icons.arrow_back, color: AppColor.white, size: 30,),
                    ),
                  ),
                ],
              ),


              SizedBox(height: 10,),
              Text(
                "Submit your assignment",
                style: normalText(
                  fontSize: 20,
                ),
              ),

              SizedBox(height: 20,),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Courses",
                    style: normalText(
                      fontColor: AppColor.primaryColor
                    ),
                  ),
                  SizedBox(height: 5,),
                  CustomDropDown(
                      items: allCourses,
                      hint: "",
                      onChange: (v)=>controller.selectCourses(v)
                  )
                ],
              ),
              SizedBox(height: 15,),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Assignment Type",
                    style: normalText(
                        fontColor: AppColor.primaryColor
                    ),
                  ),
                  SizedBox(height: 5,),
                  CustomDropDown(
                      items: assignmentType,
                      hint: "",
                      onChange: (v)=>controller.selectAssignmentType(v)
                  )
                ],
              ),
              SizedBox(height: 15,),

              Obx(() {
                  return AppInput(
                    onTap: ()=>controller.selectDeuDate(context),
                      title: "Due Date",
                      hintText: "",
                      readOnly: true,
                      controller: controller.selectedDueDate.value
                  );
                }
              ),
              SizedBox(height: 15,),

              Obx(() {
                return AppInput(
                    onTap: ()=>controller.attachFile(),
                    title: "Attach file",
                    hintText: "",
                    readOnly: true,
                    controller: controller.selectedAttachFile.value
                );
              }
              ),
              SizedBox(height: 15,),

              Obx(() {
                return AppInput(
                    maxLine: 6,
                    title: "Description",
                    hintText: "Type something...",
                    controller: controller.description.value
                );
              }
              ),
              SizedBox(height: 15,),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 150,
                  height: 40,
                  padding: EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                    color: Color(0xff62370C),
                    borderRadius: BorderRadius.circular(100)
                  ),
                  child: Row(
                    children: [
                      Image.asset(AppAssets.fire_icon, height: 30, width: 30,),
                      SizedBox(width: 5,),
                      Flexible(
                        child: Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            "Instant delivery (1-4 hours)",
                            style: normalText(fontSize: 10),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30,),
              AppButton(title: "Submit", onTap: (){}),
              SizedBox(height: 30,),


            ],
          ),
        ),
      ),
      bottomNavigationBar: AppBottomMenu(),
    );
  }
}
