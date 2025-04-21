import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/auth/login/controllers/login_controller.dart';
import 'package:kuwait_elearing/app/modules/auth/signup/controllers/signup_controller.dart';
import 'package:kuwait_elearing/confim/api_config.dart';
import 'package:kuwait_elearing/confim/api_service.dart';

import '../../../../routes/app_pages.dart';

class OtpController extends GetxController {
  //TODO: Implement OtpController


  final SignupController _signupController = Get.put(SignupController());

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }
  Rx<TextEditingController> otp = TextEditingController().obs;

  //verify otp
  RxBool isLoading = false.obs;
  verifyOTP(email)async{
    isLoading.value = true;
    var response = await ApiServer.withoutPostApi(url: ApiConfig.OTP_VERIFY,
      body: {
        "email": email,
        "resetCode": otp.value.text,
      },
    );
    isLoading.value = false;
    if(response.statusCode == 200){
      if(Get.previousRoute == Routes.FORGET_PASSWORD){
        Get.toNamed(Routes.RESET_PASSWORD, arguments: {"email" : email, "resetCode" : otp.value.text});
      }else{
        await  _signupController.signUpWithEmail();
      }

    }
    isLoading.value = false;
  }
}
