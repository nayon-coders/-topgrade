import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kuwait_elearing/app/routes/app_pages.dart';
import 'package:kuwait_elearing/confim/api_config.dart';
import 'package:kuwait_elearing/confim/api_service.dart';
import 'package:kuwait_elearing/utility/app_color.dart';

class ResetPasswordController extends GetxController {
  //TODO: Implement ResetPasswordController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  var resetPasskey = GlobalKey<FormState>().obs;
  RxString errorString = "".obs;
  Rx<TextEditingController> newPassword = TextEditingController().obs;
  Rx<TextEditingController> confirmPassword = TextEditingController().obs;

  RxBool isLoading = false.obs;
  //reset password
  resetPassword(email, resetCode)async{
    print("resetCode -- ${email}");
    print("resetCode -- ${resetCode}");
    isLoading.value = true;
    var response = await ApiServer.withoutPostApi(
      url: ApiConfig.RESET_PASSWORD,
      body: {
        "email": email,
        "resetCode": resetCode,
        "newPassword": newPassword.value.text
      }
    );
    if(response.statusCode == 200){
      Get.toNamed(Routes.RESET_PASSWORD_SECCESS);
      Get.snackbar("Success!", "Reset password success!", backgroundColor: AppColor.primaryColor, colorText: AppColor.white);
    }else{
      Get.snackbar("Error!", "Password reset failed", backgroundColor: AppColor.primaryColor, colorText: AppColor.white);
    }
    isLoading.value = false;
  }
}
