import 'package:get/get.dart';

import '../controllers/courses_course_content_controller.dart';

class CoursesCourseContentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoursesCourseContentController>(
      () => CoursesCourseContentController(),
    );
  }
}
