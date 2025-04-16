import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../utility/app_color.dart';
import '../../../../routes/app_pages.dart';
import '../../../../widgets/app_network_images.dart';
import '../../../../widgets/app_style.dart';
import '../../../../widgets/app_top_bar.dart';
import '../../../../widgets/default_page_layout.dart';
import '../../../bottom_navigations/bottom_menus/views/bottom_menus_view.dart';
import '../controllers/student_home_tutoring_controller.dart';

class StudentHomeTutoringView extends GetView<StudentHomeTutoringController> {
  const StudentHomeTutoringView({super.key});
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
                      onTap: ()=>Get.toNamed(Routes.STUDENT_TUTORING_DETAILS),
                      child: Container(
                        width: Get.width,
                        height: 100,
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
                                  height: 80, weight: 60,
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
