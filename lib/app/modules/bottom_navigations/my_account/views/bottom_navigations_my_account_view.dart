import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/auth/login/controllers/login_controller.dart';
import 'package:kuwait_elearing/app/routes/app_pages.dart';
import 'package:kuwait_elearing/app/widgets/app_style.dart';
import 'package:kuwait_elearing/app/widgets/app_top_bar.dart';
import 'package:kuwait_elearing/app/widgets/default_page_layout.dart';
import 'package:kuwait_elearing/utility/app_color.dart';
import 'package:radio_group_v2/widgets/views/radio_group.dart';

import '../controllers/bottom_navigations_my_account_controller.dart';

class BottomNavigationsMyAccountView
    extends GetView<BottomNavigationsMyAccountController> {
  const BottomNavigationsMyAccountView({super.key});

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
                child: Text("My account ",
                  style: normalText(fontSize: 35, fontColor: AppColor.primaryColor),
                ),
              ),
              SizedBox(height: 10,),
              Divider(height: 2, color: AppColor.primaryColor,),
              SizedBox(height: 10,),
              Obx((){
                  return Text("Welcome ${controller.myInfoModel.value.data == null ? "" : controller.myInfoModel.value.data!.firstName ?? ""}",
                    style: normalText(fontColor: Color(0xffA3850D), fontSize: 25),
                  );
                }
              ),
              SizedBox(height: 10,),
              _buildMenuItem(
                onTap: ()=>Get.toNamed(Routes.EDIT_ACCOUNT_INFO),
                title: "Edit account information",
                icon: Icons.edit,
              ),

              _buildMenuItem(
                onTap: (){},
                title: "Installments",
                icon: Icons.attach_money,
              ),

              _buildMenuItem(
                onTap: ()=>Get.toNamed(Routes.CHANGE_PASSWORD),
                title: "Change Password",
                icon: Icons.lock,
              ),

              _buildMenuItem(
                onTap: ()=>changeLanguages(context),
                title: "Change Languages",
                icon: Icons.language,
              ),

              _buildMenuItem(
                onTap: (){},
                title: "Contact us",
                icon: Icons.chat,
              ),

              _buildMenuItem(
                onTap: ()=>logout(context),
                title: "Logout",
                icon: Icons.logout,
                textColor: Colors.red,
              ),




            ],
          ),
        ),
      )
    );
  }

  //logout
  logout(context){
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 260,
          padding: EdgeInsets.all(20),
          color: AppColor.primaryColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                 Center(
                   child: Text("Are you sure you want to log out?",
                    style: normalText(
                      fontColor: Colors.red,
                      fontSize: 15
                    ),
                   ),
                 ),
               SizedBox(height: 30,),
                InkWell(
                  onTap: ()=>controller.logout(),
                  child: Container(
                    width: Get.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 2, color: AppColor.white)
                    ),
                    child: Center(
                      child: Text("Logout",
                        style: normalText(fontColor: Colors.red),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  width: Get.width,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 2, color: AppColor.white)
                  ),
                  child: Center(
                    child: Text("Cancel",
                      style: normalText(fontColor: AppColor.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }


  //change languages
  changeLanguages(context){
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 260,
          padding: EdgeInsets.all(20),
          color: AppColor.primaryColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text("Choose language",
                    style: normalText(
                        fontSize: 15
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                InkWell(
                  onTap: ()=>controller.changeLanguage(true),
                  child: Container(
                    width: Get.width,
                    height: 50,
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 2, color: AppColor.white)
                    ),
                    child: Row(
                      children: [
                        Obx((){
                            return  InkWell(
                              onTap: ()=>controller.changeLanguage(true),
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: AppColor.white,
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(width: 3, color: controller.isEnglishLan.value ?  Colors.green : AppColor.white)
                                ),
                              ),
                            );
                          }
                        ),
                        SizedBox(width: 20,),
                        Text("English",
                          style: normalText(),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                  InkWell(
                    onTap: ()=>controller.changeLanguage(false),
                  child: Container(
                    width: Get.width,
                    height: 50,
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 2, color: AppColor.white)
                    ),
                    child: Row(
                      children: [
                        Obx((){
                          return InkWell(
                            onTap: ()=>controller.changeLanguage(false),
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(width: 3, color: controller.isEnglishLan.value ? AppColor.white : Colors.green)
                              ),
                            ),
                          );
                        }
                        ),
                        SizedBox(width: 20,),
                        Text("English",
                          style: normalText(),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class _buildMenuItem extends StatelessWidget {
  const _buildMenuItem({
    super.key, this.textColor = AppColor.white, required this.icon, required this.title, required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        height: 45,
        padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(100)
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 30),
            SizedBox(width: 10,),
            Text(title,
              style: normalText(fontSize: 15, fontColor: textColor),
            ),
          ],
        )
      ),
    );
  }
}



