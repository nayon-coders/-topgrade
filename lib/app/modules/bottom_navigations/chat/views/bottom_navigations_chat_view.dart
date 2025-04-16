import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kuwait_elearing/app/widgets/app_network_images.dart';
import 'package:kuwait_elearing/app/widgets/app_style.dart';
import 'package:kuwait_elearing/app/widgets/app_top_bar.dart';
import 'package:kuwait_elearing/app/widgets/default_page_layout.dart';
import 'package:kuwait_elearing/utility/app_color.dart';

import '../controllers/bottom_navigations_chat_controller.dart';

class BottomNavigationsChatView
    extends GetView<BottomNavigationsChatController> {
  const BottomNavigationsChatView({super.key});
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
              AppTopBar(),
              Center(
                child: Text("Chat",
                  style: normalText(
                    fontSize: 35,
                    fontColor: AppColor.primaryColor
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Divider(height: 1, color: AppColor.primaryColor,),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 10,
                  itemBuilder: (_, index){
                    return Container(
                      width: Get.width,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1, color: AppColor.primaryColor)
                        )
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: ClipRRect(
                              child: AppNetworkImage(url: "/691f/4410c49ac1a23442c038219513610d35?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=oq0FbCGoSbuMqp5mO~PvoRGtsKzw73p~qSzQ-zuIIP9vVWnSDmRTTSjiJaNANJIl~TBBZdX~ebAGek-8lwW~yV6aHBlEQMlrE3v3l8NVrQb3pC0PmaPIjovu-sQwbHiGbKrKj6may~RCM-Y6KUlWAu0jg6HBTMPfDx8U6UOiopiTkd3u7JXOUJtgUok9Zg6nJRTYwS4TVU8-abpOwehI1Z3AfpMafauxQU2Rhof3TA78n7iZAyBMw48~njtIL3EmjdjosjLOmiVS0UxvhJK-XmB4BNvIR-cZschcDPmii-Yk56hn8KDovpwj0e1IAir~0h-0R7EkGKXOqwsgOiieVQ__",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: Get.width-120,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Mr. Saad",
                                      style: normalText(fontColor: AppColor.primaryColor),
                                    ),
                                    Text("8:17pm",
                                      style: normalText(fontColor: AppColor.primaryColor),
                                    ),

                                  ],
                                ),
                              ),
                              SizedBox(height: 5,),
                              SizedBox(
                                width: Get.width-120,
                                child: Text("Mr. Saad: Hello, your assignment is ready. Please tell me if you need anything changed!",
                                  style: normalText(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    fontColor: AppColor.primaryColor
                                  ),
                                ),
                              )
                            ],
                          ),


                        ],
                      ),
                    );
                  },
                ),
              )

            ],
          ),
        ),
      )
    );
  }
}
