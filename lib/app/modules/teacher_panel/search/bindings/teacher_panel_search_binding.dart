import 'package:get/get.dart';

import '../controllers/teacher_panel_search_controller.dart';

class TeacherPanelSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherPanelSearchController>(
      () => TeacherPanelSearchController(),
    );
  }
}
