import 'dart:convert';

import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/bottom_navigations/home/controllers/home_controller.dart';
import 'package:kuwait_elearing/app/modules/courses/cource_topics/controllers/courses_cource_topics_controller.dart';
import 'package:kuwait_elearing/app/modules/courses/course_content/model/single_course_details_model.dart';
import 'package:kuwait_elearing/app/modules/courses/single_course_instractor/controllers/courses_single_course_instractor_controller.dart';
import 'package:kuwait_elearing/confim/api_config.dart';
import 'package:kuwait_elearing/confim/api_service.dart';

class CoursesCourseContentController extends GetxController {
  //TODO: Implement CoursesCourseContentController

  static CoursesCourseContentController get to => CoursesCourseContentController();
  @override
  void onInit() {
    getSingleCourseDetails();
    super.onInit();
  }

  RxBool isPackage = true.obs;
  RxBool isSemester = false.obs;
  void changePackage(value)=>isPackage.value = value;
  String courseTopicsId = CoursesCourceTopicsController.to.topicsId;
  String teacherId = CoursesSingleCourseInstractorController.to.selectedTeacherId;


  Rx<SingleCourseDetailsModel> singleCourseDetailsModel = SingleCourseDetailsModel().obs;
  RxBool isLoading = false.obs;
  getSingleCourseDetails()async{
    isLoading.value = true;
    var response = await ApiServer.getApi(url: ApiConfig.UNIVERSITY_SINGLE_COURSE_DETAILS+"?course_topic_id=$courseTopicsId&teacher_id=$teacherId");
    if(response.statusCode == 200){
      singleCourseDetailsModel.value = SingleCourseDetailsModel.fromJson(jsonDecode(response.body));
    }
    isLoading.value = false;
  }
}
