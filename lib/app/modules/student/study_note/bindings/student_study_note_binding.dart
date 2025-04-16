import 'package:get/get.dart';

import '../controllers/student_study_note_controller.dart';

class StudentStudyNoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentStudyNoteController>(
      () => StudentStudyNoteController(),
    );
  }
}
