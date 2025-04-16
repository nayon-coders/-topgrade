import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kuwait_elearing/app/widgets/app_style.dart';

import '../../../../../utility/app_assets.dart';
import '../../../../../utility/app_color.dart';
import '../../../../routes/app_pages.dart';
import '../../../../widgets/app_button.dart';
import '../../../../widgets/app_input.dart';
import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      
        body: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            gradient: AppColor.primaryGradient,
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(left: 20, right: 20, top: 80),
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
                  key: controller.resetPasskey.value,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppInput(
                          title: "Enter your new password",
                          hintText: "",
                          controller: controller.newPassword.value
                      ),
                    SizedBox(height: 15,),
                    AppInput(
                          title: "Re-enter your new password",
                          hintText: "",
                          controller: controller.confirmPassword.value
                      ),
                      SizedBox(height: 4,),
                      Obx(() {
                          return Visibility(
                            visible: controller.errorString.value.isNotEmpty,
                            child: Text( controller.errorString.value,
                              style: normalText(fontSize: 11, fontColor: Colors.red),
                            ),
                          );
                        }
                      ),

                      SizedBox(height: 30,),
                      Center(
                        child: Obx(() {
                            return AppButton(
                              isLoading: controller.isLoading.value,
                              title: "Continue",
                              onTap: () {
                                controller.errorString.value = "";
                               if(controller.confirmPassword.value.text != controller.newPassword.value.text){
                                   controller.errorString.value = "Re-enter password not match";
                                   return;
                                }else{
                                  if(controller.resetPasskey.value.currentState!.validate()){
                                    controller.resetPassword(Get.arguments["email"],
                                      Get.arguments["resetCode"],);
                                  }
                                }


                              }
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
