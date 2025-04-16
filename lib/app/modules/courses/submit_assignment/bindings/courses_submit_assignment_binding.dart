import 'package:get/get.dart';

import '../controllers/courses_submit_assignment_controller.dart';

class CoursesSubmitAssignmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoursesSubmitAssignmentController>(
      () => CoursesSubmitAssignmentController(),
    );
  }
}
