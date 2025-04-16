import 'package:get/get.dart';

import '../controllers/edit_account_info_controller.dart';

class EditAccountInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditAccountInfoController>(
      () => EditAccountInfoController(),
    );
  }
}
