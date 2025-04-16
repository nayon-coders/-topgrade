import 'package:get/get.dart';

import '../controllers/student_student_cart_controller.dart';

class StudentStudentCartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentStudentCartController>(
      () => StudentStudentCartController(),
    );
  }
}
