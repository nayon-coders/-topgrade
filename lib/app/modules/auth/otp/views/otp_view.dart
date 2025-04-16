import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../utility/app_assets.dart';
import '../../../../../utility/app_color.dart';
import '../../../../routes/app_pages.dart';
import '../../../../widgets/app_button.dart';
import '../../../../widgets/app_input.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
   OtpView({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColor.white,),
            onPressed: (){
              Get.back();
            },
          ),
        ),
        body: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            gradient: AppColor.primaryGradient,
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Image.asset(AppAssets.logo, height: 150, width: Get.width, fit: BoxFit.cover,),

                SizedBox(height: 40,),
                Center(
                  child: Text("OTP",
                    style: TextStyle(
                        color: AppColor.black,
                        fontSize: 36,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                //form
                Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppInput(
                          title: "",
                          hintText: "",
                          controller: controller.otp.value
                      ),

                      SizedBox(height: 30,),
                      Center(child: Obx((){
                          return AppButton(
                            isLoading: controller.isLoading.value,
                            title: "Continue", onTap: ()=> controller.verifyOTP(Get.arguments));
                        }
                      ),),
                      SizedBox(height: 30,),


                    ],
                  ),
                )
              ],
            ),

          ),
        )
    );
  }
}
