import 'package:get/get.dart';

import '../controllers/student_home_tutoring_controller.dart';

class StudentHomeTutoringBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentHomeTutoringController>(
      () => StudentHomeTutoringController(),
    );
  }
}
