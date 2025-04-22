import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/bottom_navigations/bottom_menus/views/bottom_menus_view.dart';
import 'package:kuwait_elearing/app/routes/app_pages.dart';
import 'package:kuwait_elearing/app/widgets/app_style.dart';
import 'package:kuwait_elearing/app/widgets/app_top_bar.dart';
import 'package:kuwait_elearing/app/widgets/default_page_layout.dart';
import 'package:kuwait_elearing/utility/app_color.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultPageLayout(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTopBar(
                  isBack: true,
                  onBack: ()=>Get.back(),
                  isShowCart: false,
                ),
                SizedBox(height: 30,),
                
                Center(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      alignment: Alignment.center,
                      height: 250,
                      margin: EdgeInsets.all(30),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text("You will receive a payment link within 1 hour.",
                              textAlign: TextAlign.center,
                              style: normalText(),
                            ),
                          ),
                          Center(
                            child: Text("Please pay and send a screenshot to confirm order.",
                              textAlign: TextAlign.center,
                              style: normalText(),
                            ),
                          ),
                          SizedBox(height: 40,),
                          Center(
                            child: InkWell(
                              onTap: (){
                                Get.offAllNamed(Routes.BOTTOM_MENUS);
                              },
                              child: Container(
                                width: 150,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: AppColor.secounderyColor,
                                  borderRadius: BorderRadius.circular(30)
                                ),
                                child: Center(
                                  child: Text("Continue",
                                    style: normalText(),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
      
                  ),
                )
      
              ],
            ),
          ),
        ),
      ),
   
    );
  }
}
