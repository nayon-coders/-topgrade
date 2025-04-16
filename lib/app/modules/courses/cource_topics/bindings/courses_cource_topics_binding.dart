import 'package:get/get.dart';

import '../controllers/courses_cource_topics_controller.dart';

class CoursesCourceTopicsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoursesCourceTopicsController>(
      () => CoursesCourceTopicsController(),
    );
  }
}
