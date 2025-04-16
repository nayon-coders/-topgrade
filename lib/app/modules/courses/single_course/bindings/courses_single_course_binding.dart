import 'package:get/get.dart';

import '../controllers/courses_single_course_controller.dart';

class CoursesSingleCourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoursesSingleCourseController>(
      () => CoursesSingleCourseController(),
    );
  }
}
