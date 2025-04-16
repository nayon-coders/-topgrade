import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/bottom_navigations/bottom_menus/views/bottom_menus_view.dart';
import 'package:kuwait_elearing/app/widgets/app_style.dart';
import 'package:kuwait_elearing/app/widgets/app_top_bar.dart';
import 'package:kuwait_elearing/app/widgets/default_page_layout.dart';

import '../../../../utility/app_color.dart';
import '../../../widgets/app_network_images.dart';
import '../controllers/course_order_details_controller.dart';

class CourseOrderDetailsView extends GetView<CourseOrderDetailsController> {
  const CourseOrderDetailsView({super.key});
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
                isShowCart: false,
                onBack: ()=>Get.back(),
              ),
              Center(
                child: Text("Order #192834",
                  style: normalText(fontSize: 35),
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: Container(
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
                                Text("Course",
                                  style: normalText(fontSize: 15),
                                ),
                                SizedBox(height: 20,),
                                Text("Date: 10/2/2025 ",
                                  style: normalText(fontSize: 15),
                                ),
                                SizedBox(height: 20,),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Status: ",
                                        style: normalText(fontSize: 13, fontColor: AppColor.white)
                                      ),
                                      TextSpan(
                                        text: "Delivered",
                                        style: normalText(fontSize: 13, fontColor: Color(0xff68F906))
                                      ),
                                    ]
                                  ),
                                )
                
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
                      SizedBox(height: 20,),
                      Spacer(),
                      Center(
                        child: Container(
                          width: 150,
                          height: 40,
                          decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(100)
                          ),
                          child: Center(
                            child: Text("Go to Videos",
                              style: normalText(fontSize: 15, fontColor: AppColor.primaryColor),
                            ),
                          ),
                        ),
                      )
                
                
                   
                    ],
                  ),
                ),
              ),

              SizedBox(height: 40,),

            ],
          ),
        ),
      ),
      bottomNavigationBar: AppBottomMenu(),
    );
  }
}
