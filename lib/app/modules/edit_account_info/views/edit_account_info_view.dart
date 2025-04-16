import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/bottom_navigations/bottom_menus/views/bottom_menus_view.dart';
import 'package:kuwait_elearing/app/widgets/app_input.dart';
import 'package:kuwait_elearing/app/widgets/app_style.dart';
import 'package:kuwait_elearing/app/widgets/app_top_bar.dart';
import 'package:kuwait_elearing/utility/app_color.dart';

import '../../../widgets/default_page_layout.dart';
import '../controllers/edit_account_info_controller.dart';

class EditAccountInfoView extends GetView<EditAccountInfoController> {
  const EditAccountInfoView({super.key});
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
                child: Text("Change information",
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
                  title: "First Name",
                  hintText: "",
                  controller: controller.firstName.value,
                  filledColor: AppColor.primaryColor,
                filledTextColor: AppColor.white,
              ),
              SizedBox(height: 15,),
              AppInput(
                title: "Last Name",
                hintText: "",
                controller: controller.lastName.value,
                filledColor: AppColor.primaryColor,
                filledTextColor: AppColor.white,
              ),
              SizedBox(height: 15,),
              AppInput(
                title: "Phone Number",
                hintText: "",
                controller: controller.phoneNumber.value,
                filledColor: AppColor.primaryColor,
                filledTextColor: AppColor.white,
              ),
              SizedBox(height: 30,),
              Center(
                child: InkWell(
                  onTap: ()=>controller.updateInformation(),
                  child: Obx(() {
                      return Container(
                        width: 150,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xffA3850D),
                          borderRadius: BorderRadius.circular(100)
                        ),
                        child: Center(
                          child: controller.isUpdateData.value ? CircularProgressIndicator.adaptive(backgroundColor: AppColor.white,) : Text("Confirm Changes",
                            style: normalText(
                              fontSize: 15,
                              fontColor: AppColor.primaryColor
                            ),
                          ),
                        ),
                      );
                    }
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
