import 'package:get/get.dart';

import '../controllers/teacher_panel_my_order_controller.dart';

class TeacherPanelMyOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherPanelMyOrderController>(
      () => TeacherPanelMyOrderController(),
    );
  }
}
