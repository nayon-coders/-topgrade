import 'package:get/get.dart';

import '../controllers/bottom_navigations_search_controller.dart';

class BottomNavigationsSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigationsSearchController>(
      () => BottomNavigationsSearchController(),
    );
  }
}
