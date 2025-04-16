import 'package:get/get.dart';

import '../controllers/teacher_panel_my_account_controller.dart';

class TeacherPanelMyAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherPanelMyAccountController>(
      () => TeacherPanelMyAccountController(),
    );
  }
}
