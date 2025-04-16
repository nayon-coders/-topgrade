import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utility/app_color.dart';
import '../../../widgets/app_input.dart';
import '../../../widgets/app_style.dart';
import '../../../widgets/app_top_bar.dart';
import '../../../widgets/default_page_layout.dart';
import '../../bottom_navigations/bottom_menus/views/bottom_menus_view.dart';
import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({super.key});
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
              Center(
                child: Text("Change Password",
                  style: normalText(
                      fontColor: Color(0xffA3850D),
                      fontSize: 24
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Divider(height: 1, color: AppColor.primaryColor,),
              SizedBox(height: 30,),
              AppInput(
                title: "Current Password",
                hintText: "",
                controller: controller.currentPassword.value,
                filledColor: AppColor.primaryColor,
                filledTextColor: AppColor.white,
              ),
              SizedBox(height: 15,),
              AppInput(
                title: "New Password",
                hintText: "",
                controller: controller.newPassword.value,
                filledColor: AppColor.primaryColor,
                filledTextColor: AppColor.white,
              ),
              SizedBox(height: 15,),
              AppInput(
                title: "Confirm New Password",
                hintText: "",
                controller: controller.confirmPassword.value,
                filledColor: AppColor.primaryColor,
                filledTextColor: AppColor.white,
              ),
              SizedBox(height: 30,),
              Center(
                child: Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Color(0xffA3850D),
                      borderRadius: BorderRadius.circular(100)
                  ),
                  child: Center(
                    child: Text("Confirm Changes",
                      style: normalText(
                          fontSize: 15,
                          fontColor: AppColor.primaryColor
                      ),
                    ),
                  ),
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
