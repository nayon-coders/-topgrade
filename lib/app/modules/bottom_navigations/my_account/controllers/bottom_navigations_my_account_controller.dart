import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kuwait_elearing/app/modules/edit_account_info/controllers/edit_account_info_controller.dart';
import 'package:kuwait_elearing/app/modules/edit_account_info/model/my_info_model.dart';
import 'package:kuwait_elearing/confim/api_config.dart';
import 'package:kuwait_elearing/confim/api_service.dart';
import 'package:radio_group_v2/widgets/view_models/radio_group_controller.dart';

import '../../../../../main.dart';
import '../../../../../utility/app_color.dart';
import '../../../../../utility/app_const.dart';
import '../../../../routes/app_pages.dart';

class BottomNavigationsMyAccountController extends GetxController {
  //TODO: Implement BottomNavigationsMyAccountController



  RxBool isEnglishLan = true.obs;

  final count = 0.obs;
  @override
  void onInit() {
    getMyDetails(); //init
    super.onInit();
  }

  changeLanguage(value)=>isEnglishLan.value = value;

  //get my info
  Rx<MyInfoModel> myInfoModel = MyInfoModel().obs;
  getMyDetails()async{
    var response = await ApiServer.getApi(url: ApiConfig.MY_ACCOUNT,);
    if(response.statusCode == 200){
      myInfoModel.value = MyInfoModel.fromJson(jsonDecode(response.body));
      Get.put(EditAccountInfoController()).setValue(myInfoModel.value);
    }else{
      myInfoModel.value = MyInfoModel();
    }
  }


  //logout
  Future logout()async{
    signOut();
    sharedPreferences!.remove(AppConst.TOKEN);
    sharedPreferences!.remove(AppConst.USER_ID);
    sharedPreferences!.remove(AppConst.ROLE);
    Get.offAllNamed(Routes.LOGIN); 
  }
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
    Get.snackbar("Logged out", "Successfully signed out",  backgroundColor: AppColor.primaryColor, colorText: AppColor.white);
  }
}
