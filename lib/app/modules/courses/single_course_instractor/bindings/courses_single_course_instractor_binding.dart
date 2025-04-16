import 'package:get/get.dart';

import '../controllers/courses_single_course_instractor_controller.dart';

class CoursesSingleCourseInstractorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoursesSingleCourseInstractorController>(
      () => CoursesSingleCourseInstractorController(),
    );
  }
}
