import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/bottom_navigations/bottom_menus/views/bottom_menus_view.dart';
import 'package:kuwait_elearing/app/routes/app_pages.dart';
import 'package:kuwait_elearing/app/widgets/app_network_images.dart';
import 'package:kuwait_elearing/app/widgets/app_style.dart';
import 'package:kuwait_elearing/app/widgets/app_top_bar.dart';
import 'package:kuwait_elearing/app/widgets/default_page_layout.dart';
import 'package:kuwait_elearing/utility/app_color.dart';

import '../controllers/student_tutoring_details_controller.dart';

class StudentTutoringDetailsView
    extends GetView<StudentTutoringDetailsController> {
  const StudentTutoringDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultPageLayout(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10, right: 10),
              child: AppTopBar(
                isBack: true,
                onBack: ()=>Get.back(),
              ),
            ),

            Container(
              height: 200,
              width: Get.width,
              decoration: BoxDecoration(
                  color: Colors.black
              ),
              child: Center(
                child: Icon(Icons.play_arrow, color: Colors.white, size: 50,),
              ),
            ),
            SizedBox(height: 10,),

            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: SizedBox(
                      height: 60,
                      width: 60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: AppNetworkImage(url: "https://s3-alpha-sig.figma.com/img/66fb/691f/4410c49ac1a23442c038219513610d35?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=oq0FbCGoSbuMqp5mO~PvoRGtsKzw73p~qSzQ-zuIIP9vVWnSDmRTTSjiJaNANJIl~TBBZdX~ebAGek-8lwW~yV6aHBlEQMlrE3v3l8NVrQb3pC0PmaPIjovu-sQwbHiGbKrKj6may~RCM-Y6KUlWAu0jg6HBTMPfDx8U6UOiopiTkd3u7JXOUJtgUok9Zg6nJRTYwS4TVU8-abpOwehI1Z3AfpMafauxQU2Rhof3TA78n7iZAyBMw48~njtIL3EmjdjosjLOmiVS0UxvhJK-XmB4BNvIR-cZschcDPmii-Yk56hn8KDovpwj0e1IAir~0h-0R7EkGKXOqwsgOiieVQ__",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text("Mr. Mohammed",
                      style: normalText(
                          fontColor: AppColor.primaryColor
                      ),
                    ),
                    subtitle: Text("Rating ",
                      style: normalText(
                          fontColor: AppColor.primaryColor
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Divider(height: 1, color: Colors.black,),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      width: Get.width,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColor.primaryColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Mr. Mohammed",
                            style: normalText(
                                fontSize: 20
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text("Description: Expertise in Mathematics 7 years, with a bachelors degree. Tutoring students all across Kuwait for 3 years.",
                            style: normalText(fontSize: 13),
                          ),
                          SizedBox(height: 10,),
                          RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: "Choose date and time:",
                                      style: normalText(fontSize: 13)
                                  ),
                                  TextSpan(
                                      text: " Price per hour: 20.000 KWD.",
                                      style: normalText(
                                          fontColor: AppColor.secounderyColor,
                                          fontSize: 13
                                      )
                                  )
                                ]
                            ),
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: (){},
                                icon: Icon(Icons.date_range, color: Colors.white, size: 50,),
                              ),
                              IconButton(
                                onPressed: (){},
                                icon: Icon(Icons.watch_later_outlined, color: Colors.white, size: 50,),
                              )
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Date and Time: ",
                                            style: normalText(fontSize: 14)
                                          ),
                                          TextSpan(
                                              text: "18th Feb, 2025. 8-10PM ",
                                              style: normalText(fontSize: 14, fontColor: AppColor.secounderyColor)
                                          )
                                        ]
                                      ),
                                    ),
                                    SizedBox(height: 8,),
                                    RichText(
                                      text: TextSpan(
                                          children: [
                                            TextSpan(
                                                text: "Total hours : ",
                                                style: normalText(fontSize: 14)
                                            ),
                                            TextSpan(
                                                text: "2 Hours",
                                                style: normalText(fontSize: 14, fontColor: AppColor.secounderyColor)
                                            )
                                          ]
                                      ),
                                    ),
                                    SizedBox(height: 8,),

                                    RichText(
                                      text: TextSpan(
                                          children: [
                                            TextSpan(
                                                text: "Total: ",
                                                style: normalText(fontSize: 14)
                                            ),
                                            TextSpan(
                                                text: "40.000 KD",
                                                style: normalText(fontSize: 14, fontColor: AppColor.secounderyColor)
                                            )
                                          ]
                                      ),
                                    ),
                                    SizedBox(height: 8,),


                                  ],
                                ),
                              ),
                              SizedBox(width: 30,),
                              Container(
                                width: 100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: AppColor.white,
                                        borderRadius: BorderRadius.circular(100)
                                      ),
                                      child: Center(
                                        child: Text("Chat",
                                          style: normalText(fontColor: AppColor.primaryColor, fontSize: 12),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                    InkWell(
                                      onTap: ()=>Get.toNamed(Routes.STUDENT_STUDENT_CART),
                                      child: Container(
                                        width: 100,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: AppColor.secounderyColor,
                                            borderRadius: BorderRadius.circular(100)
                                        ),
                                        child: Center(
                                          child: Text("Buy now",
                                            style: normalText(fontColor: AppColor.white, fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )

                        ],
                      ),
                    ),
                  )
                ],
              ),
            )


          ],

        ),
      ),
      bottomNavigationBar: AppBottomMenu(),
    );
  }
}
