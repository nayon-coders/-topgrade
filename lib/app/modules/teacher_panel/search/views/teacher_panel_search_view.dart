import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../utility/app_color.dart';
import '../../../../widgets/app_input.dart';
import '../../../../widgets/app_network_images.dart';
import '../../../../widgets/app_style.dart';
import '../../../../widgets/app_top_bar.dart';
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
                height: 60,
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration:  BoxDecoration(
                  color: AppColor.primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Level",
                      style: normalText(),
                    ),
                    Text("Course",
                      style: normalText(),
                    ),
                    Text("Type",
                      style: normalText(),
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 10,
                  itemBuilder: (_, index){
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
                              child: AppNetworkImage(url: "image.png"),
                            ),
                          ),
                          SizedBox(width: 10,),
                          SizedBox(width: 150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Level: High school",
                                  style: normalText(fontSize: 11),
                                ),
                                Text("Course: Math",
                                  style: normalText(fontSize: 11),
                                ),
                                Text("CAssignmenet type: Homework",
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
                                Text("Due date: 12/2/2025", style: normalText(fontSize: 11),),
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
              )
            ],
          ),
        )
    );
  }
}
