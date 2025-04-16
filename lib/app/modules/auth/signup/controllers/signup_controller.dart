import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kuwait_elearing/confim/api_config.dart';
import 'package:kuwait_elearing/confim/api_service.dart';

import '../../../../../main.dart';
import '../../../../../utility/app_color.dart';
import '../../../../../utility/app_const.dart';
import '../../../../routes/app_pages.dart';

class SignupController extends GetxController {
  //TODO: Implement SignupController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  Rx<TextEditingController> lastNameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController = TextEditingController().obs;
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> addressController = TextEditingController().obs;
  Rx<TextEditingController> country = TextEditingController().obs;

  var signupKey = GlobalKey<FormState>().obs;
  //signup
  RxBool isSignUp = false.obs;
  signUpWithEmail()async{
    isSignUp.value = true;
      var response = await ApiServer.withoutPostApi(url: ApiConfig.SIGNUP,
        body: {
          "first_name": firstNameController.value.text,
          "last_name": lastNameController.value.text,
          "email": emailController.value.text,
          "password": passwordController.value.text,
          "country": "UAE",
          "phone": phoneController.value.text,
          "role": "Student" // Emum: Student/Teacher
        }
      );
      var data = jsonDecode(response.body);
      if(response.statusCode == 200){
        isSignUp.value = false;
        sharedPreferences!.setString(AppConst.USER_ID, data["data"]["user"]["id"].toString());
        sharedPreferences!.setString(AppConst.ROLE, data["data"]["user"]["role"]);
        sharedPreferences!.setString(AppConst.TOKEN, data["data"]["token"]);
        //redirect
        Get.offAllNamed(Routes.BOTTOM_MENUS);
        Get.snackbar("Success!", "Sign up success!", backgroundColor: AppColor.primaryColor, colorText: AppColor.white);
      }else{
        Get.snackbar("Error!", "Signup failed!", backgroundColor: AppColor.primaryColor, colorText: AppColor.white);
        isSignUp.value = false;
      }

  }

}
