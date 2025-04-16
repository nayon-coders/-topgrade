import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../utility/app_assets.dart';
import '../../../../../utility/app_color.dart';
import '../../../../routes/app_pages.dart';
import '../../../../widgets/app_button.dart';
import '../controllers/reset_password_seccess_controller.dart';

class ResetPasswordSeccessView extends GetView<ResetPasswordSeccessController> {
  const ResetPasswordSeccessView({super.key});
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
             //   SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Center(
                    child: Text("Your password has been reset successfully, press continue to login.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 60,),
                Center(child: AppButton(title: "Continue", onTap: ()=>Get.toNamed(Routes.LOGIN),),),
                SizedBox(height: 30,),
                //form
              ],
            ),

          ),
        )
    );
  }
}
