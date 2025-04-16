import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/bottom_navigations/my_account/views/bottom_navigations_my_account_view.dart';
import 'package:kuwait_elearing/app/modules/edit_account_info/model/my_info_model.dart';
import 'package:kuwait_elearing/confim/api_config.dart';
import 'package:kuwait_elearing/confim/api_service.dart';
import 'package:kuwait_elearing/main.dart';
import 'package:kuwait_elearing/utility/app_color.dart';
import 'package:kuwait_elearing/utility/app_const.dart';

import '../../bottom_navigations/my_account/controllers/bottom_navigations_my_account_controller.dart';

class EditAccountInfoController extends GetxController {
  //TODO: Implement EditAccountInfoController


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }
Rx<TextEditingController> firstName = TextEditingController().obs;
Rx<TextEditingController> lastName = TextEditingController().obs;
Rx<TextEditingController> phoneNumber = TextEditingController().obs;

  RxBool isUpdateData = false.obs;
  var updateInfoKey = GlobalKey<FormState>().obs;

  //set value
  setValue(MyInfoModel data){
    firstName.value.text = data.data!.firstName!.toString();
    lastName.value.text = data.data!.lastName!.toString();
    phoneNumber.value.text = data.data!.phone!.toString();
  }

  //get my info
  updateInformation()async{
    isUpdateData.value = true; 
    var response = await ApiServer.postApi(
        url: ApiConfig.UPDATE_USER,
        body: {
          "first_name": firstName.value.text,
          "last_name" : lastName.value.text,
          "phone" : phoneNumber.value.text
        },
    );
    if(response.statusCode == 200){
      Get.back();
      Get.snackbar("Success!", "Information update success",
        backgroundColor: AppColor.primaryColor, colorText: AppColor.white
      );
      Get.find<BottomNavigationsMyAccountController>().getMyDetails();
    }

    isUpdateData.value = false;
  }
}
