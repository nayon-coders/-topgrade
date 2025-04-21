import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/cart/controllers/cart_controller.dart';

import '../controllers/checkout_controller.dart';

class CheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckoutController>(
      () => CheckoutController(),
    );
    Get.lazyPut<CartController>(
          () => CartController(),
    );
  }
}
