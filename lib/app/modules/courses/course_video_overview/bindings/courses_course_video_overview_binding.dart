import 'package:get/get.dart';

import '../../../cart/controllers/cart_controller.dart';
import '../controllers/courses_course_video_overview_controller.dart';

class CoursesCourseVideoOverviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoursesCourseVideoOverviewController>(
      () => CoursesCourseVideoOverviewController(),
    );
    Get.lazyPut<CartController>(
      () => CartController(),
    );
  }
}
