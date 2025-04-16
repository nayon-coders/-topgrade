import 'package:get/get.dart';

import '../controllers/student_student_checkout_controller.dart';

class StudentStudentCheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentStudentCheckoutController>(
      () => StudentStudentCheckoutController(),
    );
  }
}
