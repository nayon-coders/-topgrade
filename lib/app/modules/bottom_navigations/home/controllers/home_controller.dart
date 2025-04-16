import 'dart:convert';

import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/bottom_navigations/home/model/all_university_course_model.dart';
import 'package:kuwait_elearing/confim/api_config.dart';
import 'package:kuwait_elearing/confim/api_service.dart';
import 'package:kuwait_elearing/utility/app_color.dart';
import 'package:kuwait_elearing/utility/app_const.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  @override
  void onInit() {
    getAllUniversityCourse(); //inital
    super.onInit();
  }

  RxBool isUniversity = true.obs;
  //select level
  void selectLevel(value){
    isUniversity.value = value;
    Get.back();
    Get.snackbar("Level", "${isUniversity.value ? "You are selected University level courses!" : "You are selected School level courses!"}",
      backgroundColor: AppColor.primaryColor,
      colorText: AppColor.white
    );
  }


  //get all university course
  Rx<AllUniversityCourseModel> allUniversityCourseModel = AllUniversityCourseModel().obs;
  RxBool iAllUniversityCourse = false.obs;
  getAllUniversityCourse()async{
    iAllUniversityCourse.value = true;
    var response = await ApiServer.getApi(url: ApiConfig.UNIVERSITY_ALL_COURSE);
    if(response.statusCode == 200){
      allUniversityCourseModel.value = AllUniversityCourseModel.fromJson(jsonDecode(response.body));
    }else{
      allUniversityCourseModel.value = AllUniversityCourseModel();
    }
    iAllUniversityCourse.value = false;
  }




}
