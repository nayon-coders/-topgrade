import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kuwait_elearing/app/widgets/nodata_found.dart';

import '../../../../../utility/app_color.dart';
import '../../../../../utility/app_json.dart';
import '../../../../widgets/app_input.dart';
import '../../../../widgets/app_network_images.dart';
import '../../../../widgets/app_style.dart';
import '../../../../widgets/app_top_bar.dart';
import '../../../../widgets/custome_dropdown.dart';
import '../../../../widgets/default_page_layout.dart';
import '../controllers/teacher_panel_search_controller.dart';

class TeacherPanelSearchView extends GetView<TeacherPanelSearchController> {
  const TeacherPanelSearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: DefaultPageLayout(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: AppTopBar(isShowCart: false,),
              ),
              Container(
                width: Get.width,
                height: 70,
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration:  BoxDecoration(
                  color: AppColor.primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Level",
                            style: normalText(
                                fontColor: AppColor.white,
                                fontSize: 14
                            ),
                          ),
                          SizedBox(height: 5,),
                          CustomDropDown(
                              height: 25,
                              fontSize: 11, fontWeight: FontWeight.w400,
                              items: ["School", "University"],
                              hint: "",
                              onChange: (v)=>controller.selectLevel(v)
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Courses",
                            style: normalText(
                                fontColor: AppColor.white,
                              fontSize: 14
                            ),
                          ),
                          SizedBox(height: 5,),
                          Obx((){
                              return CustomDropDown(
                                height: 25,
                                  fontSize: 11, fontWeight: FontWeight.w400,
                                  items: controller.allCourses.value,
                                  hint: "",
                                  onChange: (v)=>controller.selectCourse(v)
                              );
                            }
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Type",
                            style: normalText(
                                fontColor: AppColor.white,
                                fontSize: 14
                            ),
                          ),
                          SizedBox(height: 5,),
                          CustomDropDown(
                              height: 25,
                              fontSize: 10, fontWeight: FontWeight.w400,
                              items: assignmentType,
                              hint: "",
                              onChange: (v)=>controller.selectAssignmentType(v)
                          )
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Obx(() {
                print("controller.selectedAssignmentType.value -- ${controller.selectedAssignmentType.value.isEmpty}");
                  return Visibility(
                    //visible: false,
                    visible: controller.selectedAssignmentType.value.isEmpty &&  controller.selectedAssignmentCourse.value.isEmpty &&  controller.selectedAssignmentLevel.value.isEmpty ,
                    child: controller.isGettingAllAssignment.value
                        ? Center(child: CircularProgressIndicator.adaptive(backgroundColor: AppColor.white,),)
                        : controller.allAssignmentListModel.value.isEmpty
                        ? SizedBox(height: 400, child: Center(child: NoDataFound(),),)
                        : Expanded(
                          child: RefreshIndicator(
                            onRefresh: controller.refreshAssignments,
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: controller.allAssignmentListModel.value.length,
                              itemBuilder: (_, index){
                                var data = controller.allAssignmentListModel.value[index];
                                return Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                  width: Get.width,
                                  margin: EdgeInsets.only(bottom: 20, left: 5, right: 5),
                                  decoration: BoxDecoration(
                                      color: AppColor.primaryColor,
                                      borderRadius: BorderRadius.circular(100)
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 70,
                                        height: 70,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(100),
                                          child: AppNetworkImage(url: data.courses!.image!),
                                        ),
                                      ),
                                      SizedBox(width: 10,),
                                      SizedBox(width: 150,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Level: (change it API)",
                                              style: normalText(fontSize: 11),
                                            ),
                                            Text("Course: ${data.courses!.title!}",
                                              style: normalText(fontSize: 11),
                                            ),
                                            Text("Assignment type: ${data.coursesType}",
                                              style: normalText(fontSize: 11),
                                            ),

                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10,),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text("Due date: ${data.date}", style: normalText(fontSize: 11),),
                                            RichText(text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                      text: "Lowest Bid: ",
                                                      style: normalText(fontSize: 11)
                                                  ),
                                                  TextSpan(
                                                      text: "5.000 KD ",
                                                      style: normalText(fontSize: 11, fontColor: Colors.red)
                                                  ),


                                                ]
                                            )),
                                            Row(
                                              children: [
                                                Expanded(child: Container(
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                      color: Color(0xffA3850D),
                                                      borderRadius: BorderRadius.circular(100)

                                                  ),
                                                  child: Center(
                                                    child: Text("Bid",
                                                      style: normalText(fontSize: 11),),
                                                  ),
                                                )),
                                                SizedBox(width: 5,),
                                                Expanded(
                                                    child: SizedBox(
                                                      height: 30,
                                                      child: TextFormField(
                                                        style: normalText(fontColor: AppColor.primaryColor),
                                                        decoration: InputDecoration(
                                                            filled: true,
                                                            fillColor: AppColor.white,
                                                            contentPadding: EdgeInsets.only(left: 10, right: 10),
                                                            enabledBorder: OutlineInputBorder(
                                                                borderRadius: BorderRadius.circular(100)
                                                            ),
                                                            border: OutlineInputBorder(
                                                                borderRadius: BorderRadius.circular(100)
                                                            ),
                                                            focusedBorder: OutlineInputBorder(
                                                                borderRadius: BorderRadius.circular(100)
                                                            )
                                                        ),
                                                      ),
                                                    )
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),

                                );
                              },
                            ),
                          ),
                        ),
                  );
                }
              ),


              //this is search
              /// when user filter then this widgets willbe show
              Obx(() {
                return Visibility(
                  //visible: false,
                  visible: controller.selectedAssignmentType.value.isNotEmpty ||  controller.selectedAssignmentCourse.value.isNotEmpty ||  controller.selectedAssignmentLevel.value.isNotEmpty ,
                  child: controller.searchAssignmentListModel.value.isEmpty
                      ? SizedBox(height: 400,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            NoDataFound(),
                            TextButton(
                                onPressed: (){
                                  controller.selectedAssignmentType.value = "";
                                  controller.selectedAssignmentLevel.value = "";
                                  controller.selectedAssignmentCourse.value = "";
                                },
                                child: Text("Clear filter")
                            )
                          ],
                        ),
                      )
                      : Expanded(
                        child: RefreshIndicator(
                          onRefresh: controller.refreshAssignments,
                          child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: controller.searchAssignmentListModel.value.length,
                          itemBuilder: (_, index){
                          var data = controller.searchAssignmentListModel.value[index];
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            width: Get.width,
                            margin: EdgeInsets.only(bottom: 20, left: 5, right: 5),
                            decoration: BoxDecoration(
                                color: AppColor.primaryColor,
                                borderRadius: BorderRadius.circular(100)
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: AppNetworkImage(url: data.courses!.image!),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                SizedBox(width: 150,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Level: (change it API)",
                                        style: normalText(fontSize: 11),
                                      ),
                                      Text("Course: ${data.courses!.title!}",
                                        style: normalText(fontSize: 11),
                                      ),
                                      Text("Assignment type: ${data.coursesType}",
                                        style: normalText(fontSize: 11),
                                      ),
                                          
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("Due date: ${data.date}", style: normalText(fontSize: 11),),
                                      RichText(text: TextSpan(
                                          children: [
                                            TextSpan(
                                                text: "Lowest Bid: ",
                                                style: normalText(fontSize: 11)
                                            ),
                                            TextSpan(
                                                text: "5.000 KD ",
                                                style: normalText(fontSize: 11, fontColor: Colors.red)
                                            ),
                                          
                                          
                                          ]
                                      )),
                                      Row(
                                        children: [
                                          Expanded(child: Container(
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: Color(0xffA3850D),
                                                borderRadius: BorderRadius.circular(100)
                                          
                                            ),
                                            child: Center(
                                              child: Text("Bid",
                                                style: normalText(fontSize: 11),),
                                            ),
                                          )),
                                          SizedBox(width: 5,),
                                          Expanded(
                                              child: SizedBox(
                                                height: 30,
                                                child: TextFormField(
                                                  style: normalText(fontColor: AppColor.primaryColor),
                                                  decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor: AppColor.white,
                                                      contentPadding: EdgeInsets.only(left: 10, right: 10),
                                                      enabledBorder: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(100)
                                                      ),
                                                      border: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(100)
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(100)
                                                      )
                                                  ),
                                                ),
                                              )
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                                          
                          );
                                              },
                                            ),
                        ),
                      ),
                );
              }
              ),
            ],
          ),
        )
    );
  }
}
