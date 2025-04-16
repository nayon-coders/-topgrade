import 'package:get/get.dart';

import '../controllers/bottom_navigations_my_orders_controller.dart';

class BottomNavigationsMyOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigationsMyOrdersController>(
      () => BottomNavigationsMyOrdersController(),
    );
  }
}
