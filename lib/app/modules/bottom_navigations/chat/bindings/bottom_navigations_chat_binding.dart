import 'package:get/get.dart';

import '../controllers/bottom_navigations_chat_controller.dart';

class BottomNavigationsChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigationsChatController>(
      () => BottomNavigationsChatController(),
    );
  }
}
