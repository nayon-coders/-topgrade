import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/bottom_navigations/bottom_menus/views/bottom_menus_view.dart';
import 'package:kuwait_elearing/app/widgets/app_network_images.dart';
import 'package:kuwait_elearing/app/widgets/app_style.dart';
import 'package:kuwait_elearing/app/widgets/app_top_bar.dart';
import 'package:kuwait_elearing/app/widgets/default_page_layout.dart';
import 'package:kuwait_elearing/utility/app_color.dart';

import '../controllers/student_student_checkout_controller.dart';

class StudentStudentCheckoutView
    extends GetView<StudentStudentCheckoutController> {
  const StudentStudentCheckoutView({super.key});
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
                isShowCart: false,
                isBack: true,
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
              Container(
                width: Get.width,
                height: 300,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: SizedBox(
                        width: 60, height: 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: AppNetworkImage(url: "https://s3-alpha-sig.figma.com/img/66fb/691f/4410c49ac1a23442c038219513610d35?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=oq0FbCGoSbuMqp5mO~PvoRGtsKzw73p~qSzQ-zuIIP9vVWnSDmRTTSjiJaNANJIl~TBBZdX~ebAGek-8lwW~yV6aHBlEQMlrE3v3l8NVrQb3pC0PmaPIjovu-sQwbHiGbKrKj6may~RCM-Y6KUlWAu0jg6HBTMPfDx8U6UOiopiTkd3u7JXOUJtgUok9Zg6nJRTYwS4TVU8-abpOwehI1Z3AfpMafauxQU2Rhof3TA78n7iZAyBMw48~njtIL3EmjdjosjLOmiVS0UxvhJK-XmB4BNvIR-cZschcDPmii-Yk56hn8KDovpwj0e1IAir~0h-0R7EkGKXOqwsgOiieVQ__",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text("Math",
                        style: normalText(),
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5,),
                          Text("Mr. Mohammed",
                            style: normalText(),
                          ),
                          Text("40.00 KD",
                            style: normalText(),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("%",
                                style: normalText(),
                              ),
                              SizedBox(width: 5,),
                              SizedBox(
                                width: Get.width*.50,
                                height: 30,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Coupon Code",
                                    contentPadding: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
                                    filled: true,
                                    fillColor: AppColor.inputFieldColor,
                                    border: OutlineInputBorder(
                                        borderRadius:   BorderRadius.circular(100),
                                        borderSide: BorderSide.none
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:  BorderRadius.circular(100),
                                        borderSide: BorderSide.none
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(100),
                                        borderSide: BorderSide.none
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 70,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: AppColor.white,
                                    borderRadius: BorderRadius.circular(100)
                                ),
                                child: Center(
                                  child: Text("Add",
                                    style: normalText(fontColor: Colors.black),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Coupon: (20% OFF) Added",
                                style: normalText(
                                    fontSize: 15
                                ),
                              ),
                              Text("-2.000 KD",
                                style: normalText(
                                    fontSize: 15
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 7,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total",
                                style: normalText(
                                    fontSize: 15
                                ),
                              ),
                              Text("8.000 KD KD",
                                style: normalText(
                                    fontSize: 15
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
              SizedBox(
                height: 10,
              ),
              Center(
                child: InkWell(
                  //onTap: ()=>Get.toNamed(Routes.CHECKOUT),
                  child: Container(
                    width: 140,
                    height: 50,
                    decoration: BoxDecoration(
                        color: AppColor.secounderyColor,
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: Center(
                      child: Text("Pay",
                        style: normalText(
                            fontColor: AppColor.white
                        ),
                      ),
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
