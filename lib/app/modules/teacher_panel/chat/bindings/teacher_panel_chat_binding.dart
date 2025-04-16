import 'package:get/get.dart';

import '../controllers/teacher_panel_chat_controller.dart';

class TeacherPanelChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherPanelChatController>(
      () => TeacherPanelChatController(),
    );
  }
}
