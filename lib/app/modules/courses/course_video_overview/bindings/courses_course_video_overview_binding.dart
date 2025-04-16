import 'package:get/get.dart';

import '../controllers/courses_course_video_overview_controller.dart';

class CoursesCourseVideoOverviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoursesCourseVideoOverviewController>(
      () => CoursesCourseVideoOverviewController(),
    );
  }
}
