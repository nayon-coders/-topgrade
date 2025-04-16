import 'package:get/get.dart';

import '../controllers/reset_password_seccess_controller.dart';

class ResetPasswordSeccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPasswordSeccessController>(
      () => ResetPasswordSeccessController(),
    );
  }
}
