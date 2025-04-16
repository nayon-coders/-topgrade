import 'package:get/get.dart';

import '../controllers/student_tutoring_details_controller.dart';

class StudentTutoringDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentTutoringDetailsController>(
      () => StudentTutoringDetailsController(),
    );
  }
}
