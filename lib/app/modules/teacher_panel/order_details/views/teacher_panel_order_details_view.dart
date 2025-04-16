import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../utility/app_color.dart';
import '../../../../widgets/app_network_images.dart';
import '../../../../widgets/app_style.dart';
import '../../../../widgets/app_top_bar.dart';
import '../../../../widgets/default_page_layout.dart';
import '../controllers/teacher_panel_order_details_controller.dart';

class TeacherPanelOrderDetailsView
    extends GetView<TeacherPanelOrderDetailsController> {
  const TeacherPanelOrderDetailsView({super.key});
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
                isShowCart: false,
              ),

              Container(
                width: Get.width,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(50)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Assignment: Homework ",
                                style: normalText(fontSize: 15),
                              ),
                              SizedBox(height: 20,),
                              Text("Date: 10/2/2025 ",
                                style: normalText(fontSize: 15),
                              ),
                              SizedBox(height: 20,),
                              Text("Status: Awaiting Evaluation",
                                style: normalText(fontSize: 15),
                              ),
                              SizedBox(height: 20,),
                              Text("File attatchment",
                                style: normalText(fontSize: 15),
                              ),
                              SizedBox(height: 25,),
                              Text("Due date: 15/2/2025 8pm GMT+3",
                                style: normalText(fontSize: 15),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          width: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 60,
                                height: 60,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: AppNetworkImage(url: "https://cloudfront-us-east-1.images.arcpublishing.com/opb/BRJMOGU4PUEK34KUXB4KS64BRI.jpg", fit: BoxFit.cover,),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text("Engineering: Concrete 1",
                                textAlign: TextAlign.center,
                                style: normalText(
                                  fontSize: 15,
                                ),
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    Text("Description:",
                      style: normalText(fontSize: 15),
                    ),
                    Text("********************************************************************",
                      style: normalText(fontSize: 15),
                    ),


                    //status
                    SizedBox(height: 10,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Pay: 5.00 KD",
                        style: normalText(fontSize: 15, fontColor: Colors.green),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 150,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Color(0xff76C1DC),
                              borderRadius: BorderRadius.circular(100)
                          ),
                          child: Center(
                            child: Text("Chat with Student",
                              style: normalText(fontSize: 15, fontColor: AppColor.primaryColor),
                            ),
                          ),
                        ),
                        Container(
                          width: 120,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Color(0xff4FB448),
                              borderRadius: BorderRadius.circular(100)
                          ),
                          child: Center(
                            child: Text("Change Status",
                              style: normalText(fontSize: 15, fontColor: AppColor.primaryColor),
                            ),
                          ),
                        )
                      ],
                    )


                  ],
                ),
              )






            ],
          ),
        ),
      ),
    );
  }
}
