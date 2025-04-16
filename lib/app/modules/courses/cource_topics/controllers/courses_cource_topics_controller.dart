import 'dart:convert';

import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/courses/cource_topics/model/topics_model.dart';
import 'package:kuwait_elearing/confim/api_config.dart';
import 'package:kuwait_elearing/confim/api_service.dart';

class CoursesCourceTopicsController extends GetxController {
  //TODO: Implement CoursesCourceTopicsController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  
  Rx<AllUniversityCourseTopicsModel> topicsModel = AllUniversityCourseTopicsModel().obs;
  RxBool isLoading = false.obs; 
  //getCourse topics
  getCourseTopics(id)async{
    isLoading.value = true; 
    var response = await ApiServer.withoutTokenGetApi(url: ApiConfig.UNIVERSITY_ALL_COURSE_TOPICS+"$id");
    if(response.statusCode == 200){
      topicsModel.value = AllUniversityCourseTopicsModel.fromJson(jsonDecode(response.body));
    }else{
      topicsModel.value = AllUniversityCourseTopicsModel();
    }
    isLoading.value = false;
  }

}
