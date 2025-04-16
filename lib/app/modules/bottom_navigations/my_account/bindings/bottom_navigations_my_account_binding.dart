import 'package:get/get.dart';

import '../controllers/bottom_navigations_my_account_controller.dart';

class BottomNavigationsMyAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigationsMyAccountController>(
      () => BottomNavigationsMyAccountController(),
    );

  }
}
