import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kuwait_elearing/app/routes/app_pages.dart';

import '../../../../../utility/app_assets.dart';
import '../../../../../utility/app_color.dart';
import '../../../../widgets/app_button.dart';
import '../../../../widgets/app_input.dart';
import '../controllers/forget_password_controller.dart';

class ForgetPasswordView extends GetView<ForgetPasswordController> {
  const ForgetPasswordView({super.key});
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
                  child: Text("Forget Password",
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: 25,
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
                          title: "Enter your email",
                          hintText: "Enter your email",
                          controller: controller.email.value
                      ),

                      SizedBox(height: 30,),
                      Center(
                        child: Obx(() {
                            return AppButton(
                              isLoading: controller.isSendingOTP.value,
                              title: "Continue",
                              onTap: ()=>controller.sendOtp(),
                            );
                          }
                        ),
                      ),
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
