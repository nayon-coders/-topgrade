import 'package:get/get.dart';

import '../controllers/assignment_order_details_controller.dart';

class AssignmentOrderDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssignmentOrderDetailsController>(
      () => AssignmentOrderDetailsController(),
    );
  }
}
