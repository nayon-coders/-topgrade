import 'package:get/get.dart';

import '../controllers/teacher_panel_order_details_controller.dart';

class TeacherPanelOrderDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherPanelOrderDetailsController>(
      () => TeacherPanelOrderDetailsController(),
    );
  }
}
