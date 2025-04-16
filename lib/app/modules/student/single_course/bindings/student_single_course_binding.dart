import 'package:get/get.dart';

import '../controllers/student_single_course_controller.dart';

class StudentSingleCourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentSingleCourseController>(
      () => StudentSingleCourseController(),
    );
  }
}
