import 'dart:convert';

import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/bottom_navigations/home/controllers/home_controller.dart';
import 'package:kuwait_elearing/app/modules/courses/cource_topics/controllers/courses_cource_topics_controller.dart';
import 'package:kuwait_elearing/app/modules/courses/single_course_instractor/model/course_teacher_model.dart';
import 'package:kuwait_elearing/confim/api_config.dart';
import 'package:kuwait_elearing/confim/api_service.dart';

class CoursesSingleCourseInstractorController extends GetxController {
  //TODO: Implement CoursesSingleCourseInstractorController

  static CoursesSingleCourseInstractorController get to => Get.find();

  final count = 0.obs;
  @override
  void onInit() {
    getCourseTeachers();
    super.onInit();
  }

  // getting the course id
  ///get the course id for [HomeController]
  String topicsID = CoursesCourceTopicsController.to.topicsId;
  String selectedTeacherId = "";
  Rx<CourseTeachersListModel> teacherListModel = CourseTeachersListModel().obs; 
  RxBool isLoading =  false.obs; 
  getCourseTeachers()async{
    isLoading.value = true;
    var response = await ApiServer.getApi(url: ApiConfig.UNIVERSITY_ALL_COURSE_TOPICS_TEACHER+"${topicsID}");
    if(response.statusCode == 200){
      teacherListModel.value = CourseTeachersListModel.fromJson(jsonDecode(response.body));
    }
    isLoading.value = false;
  }
}
