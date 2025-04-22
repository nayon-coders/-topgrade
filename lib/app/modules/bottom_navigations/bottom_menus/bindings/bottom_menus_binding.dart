import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/bottom_navigations/chat/bindings/bottom_navigations_chat_binding.dart';
import 'package:kuwait_elearing/app/modules/bottom_navigations/chat/controllers/bottom_navigations_chat_controller.dart';
import 'package:kuwait_elearing/app/modules/bottom_navigations/my_account/controllers/bottom_navigations_my_account_controller.dart';
import 'package:kuwait_elearing/app/modules/bottom_navigations/my_orders/controllers/bottom_navigations_my_orders_controller.dart';

import '../controllers/bottom_menus_controller.dart';

class BottomMenusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomMenusController>(
      () => BottomMenusController(),
    );
  }
}
