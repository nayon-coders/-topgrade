import 'package:get/get.dart';

import '../controllers/course_order_details_controller.dart';

class CourseOrderDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CourseOrderDetailsController>(
      () => CourseOrderDetailsController(),
    );
  }
}
