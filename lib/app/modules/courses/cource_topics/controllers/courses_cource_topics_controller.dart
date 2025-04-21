import 'dart:convert';

import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/bottom_navigations/home/controllers/home_controller.dart';
import 'package:kuwait_elearing/app/modules/courses/cource_topics/model/topics_model.dart';
import 'package:kuwait_elearing/confim/api_config.dart';
import 'package:kuwait_elearing/confim/api_service.dart';

class CoursesCourceTopicsController extends GetxController {
  //TODO: Implement CoursesCourceTopicsController
  static CoursesCourceTopicsController get to =>Get.find();
  final count = 0.obs;
  @override
  void onInit() {
    getCourseTopics();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  // get the course id
  /// Getting the course id from [HomeController]
  String selectedCourseID = HomeController.to.selectedCourseID.value;
  String topicsId = '';

  
  Rx<AllUniversityCourseTopicsModel> topicsModel = AllUniversityCourseTopicsModel().obs;
  RxBool isLoading = false.obs; 
  //getCourse topics
  getCourseTopics()async{
    isLoading.value = true; 
    var response = await ApiServer.withoutTokenGetApi(url: ApiConfig.UNIVERSITY_ALL_COURSE_TOPICS+"$selectedCourseID");
    if(response.statusCode == 200){
      topicsModel.value = AllUniversityCourseTopicsModel.fromJson(jsonDecode(response.body));
    }else{
      topicsModel.value = AllUniversityCourseTopicsModel();
    }
    isLoading.value = false;
  }

}
