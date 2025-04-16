import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/teacher_panel/my_account/controllers/teacher_panel_my_account_controller.dart';
import 'package:kuwait_elearing/app/modules/teacher_panel/my_order/controllers/teacher_panel_my_order_controller.dart';
import 'package:kuwait_elearing/app/modules/teacher_panel/search/controllers/teacher_panel_search_controller.dart';

import '../controllers/teacher_panel_dashboard_controller.dart';

class TeacherPanelDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherPanelDashboardController>(
      () => TeacherPanelDashboardController(),
    );
    Get.lazyPut<TeacherPanelMyOrderController>(
          () => TeacherPanelMyOrderController(),
    );
    Get.lazyPut<TeacherPanelSearchController>(
          () => TeacherPanelSearchController(),
    );
  }
}
