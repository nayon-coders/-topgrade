import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kuwait_elearing/app/routes/app_pages.dart';
import 'package:kuwait_elearing/confim/api_config.dart';
import 'package:kuwait_elearing/confim/api_service.dart';
import 'package:kuwait_elearing/utility/app_color.dart';

class ForgetPasswordController extends GetxController {
  //TODO: Implement ForgetPasswordController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  Rx<TextEditingController> email = TextEditingController().obs;

  //send otp
  RxBool isSendingOTP = false.obs;
  sendOtp()async{
    isSendingOTP.value = true;
    var response = await ApiServer.withoutPostApi(url: ApiConfig.EMAIL_VERIFY, body: {"email": email.value.text});
    if(response.statusCode == 200){
      Get.toNamed(Routes.OTP, arguments: email.value.text);
      isSendingOTP.value = false;
    }else{
      Get.snackbar("Error!", "Verification code send failed!",
        backgroundColor: AppColor.primaryColor, colorText: AppColor.white
      );
    }
    isSendingOTP.value = false;
  }
}
