import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/bottom_navigations/bottom_menus/views/bottom_menus_view.dart';
import 'package:kuwait_elearing/app/routes/app_pages.dart';
import 'package:kuwait_elearing/app/widgets/app_input.dart';
import 'package:kuwait_elearing/app/widgets/app_network_images.dart';
import 'package:kuwait_elearing/app/widgets/app_style.dart';
import 'package:kuwait_elearing/app/widgets/app_top_bar.dart';
import 'package:kuwait_elearing/app/widgets/default_page_layout.dart';
import 'package:kuwait_elearing/utility/app_color.dart';

import '../controllers/student_student_cart_controller.dart';

class StudentStudentCartView extends GetView<StudentStudentCartController> {
  const StudentStudentCartView({super.key});
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
                child: Text("Cart",
                  style: normalText(
                    fontSize: 32,
                    fontColor: AppColor.primaryColor
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Expanded(
                child: Container(
                  width: Get.width,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Form(
                    key: controller.cartFormKey.value,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: SizedBox(
                            width: 60,
                            height: 60,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: AppNetworkImage(url: "https://s3-alpha-sig.figma.com/img/66fb/691f/4410c49ac1a23442c038219513610d35?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=oq0FbCGoSbuMqp5mO~PvoRGtsKzw73p~qSzQ-zuIIP9vVWnSDmRTTSjiJaNANJIl~TBBZdX~ebAGek-8lwW~yV6aHBlEQMlrE3v3l8NVrQb3pC0PmaPIjovu-sQwbHiGbKrKj6may~RCM-Y6KUlWAu0jg6HBTMPfDx8U6UOiopiTkd3u7JXOUJtgUok9Zg6nJRTYwS4TVU8-abpOwehI1Z3AfpMafauxQU2Rhof3TA78n7iZAyBMw48~njtIL3EmjdjosjLOmiVS0UxvhJK-XmB4BNvIR-cZschcDPmii-Yk56hn8KDovpwj0e1IAir~0h-0R7EkGKXOqwsgOiieVQ__",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text("Mr. Mohammed",
                            style: normalText(
                                fontSize: 15,
                              fontColor: AppColor.white
                            ),
                          ),
                          subtitle: Text("40.000 KD",
                            style: normalText(
                              fontSize: 15,
                                fontColor: AppColor.white
                            ),
                          ),
                        ),

                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Expanded(
                              child: AppInput(
                                  title: "City",
                                  hintText: "",
                                  titleColor: AppColor.white,
                                  controller: controller.cityTextEditingController.value
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: AppInput(
                                  title: "Block1",
                                  hintText: "",
                                  titleColor: AppColor.white,
                                  controller: controller.block1TextEditingController.value
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Expanded(
                              child: AppInput(
                                  title: "Block 2",
                                  hintText: "",
                                  titleColor: AppColor.white,
                                  controller: controller.block2TextEditingController.value
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: AppInput(
                                  title: "Floor",
                                  hintText: "",
                                  titleColor: AppColor.white,
                                  controller: controller.floorTextEditingController.value
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Expanded(
                              child: AppInput(
                                  title: "Avenue (Optional)",
                                  hintText: "",
                                  titleColor: AppColor.white,
                                  controller: controller.avenueTextEditingController.value
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: AppInput(
                                  title: "Contact number:",
                                  hintText: "",
                                  titleColor: AppColor.white,
                                  controller: controller.contactTextEditingController.value
                              ),
                            )
                          ],
                        ), 
                        
                        SizedBox(height: 30,),
                        Center(
                          child: InkWell(
                            onTap: ()=>Get.toNamed(Routes.STUDENT_STUDENT_CHECKOUT),
                            child: Container(
                              width: 120,
                              height: 45,
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(100)
                              ),
                              child: Center(
                                child: Text("Next",
                                  style: normalText(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontColor: AppColor.primaryColor
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )



                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),

            ],
          ),
        ),
      ),
      bottomNavigationBar: AppBottomMenu(),
    );
  }
}
