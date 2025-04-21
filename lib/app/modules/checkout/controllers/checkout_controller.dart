import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/cart/controllers/cart_controller.dart';
import 'package:kuwait_elearing/app/modules/checkout/model/coupon_model.dart';
import 'package:kuwait_elearing/app/routes/app_pages.dart';
import 'package:kuwait_elearing/confim/api_config.dart';
import 'package:kuwait_elearing/confim/api_service.dart';
import 'package:kuwait_elearing/utility/app_color.dart';

class CheckoutController extends GetxController {
  //TODO: Implement CheckoutController

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTotalPayAmount();
  }
  Rx<TextEditingController> couponCode = TextEditingController().obs;
  Rx<TextEditingController> whatsAppNumber = TextEditingController().obs;
  Rx<double> totalPaymentAmount = 0.00.obs;
  Rx<double> subtotal = 0.00.obs;
  Rx<double> totalDiscountAmount = 0.00.obs;
  var orderItems = [];
  getTotalPayAmount(){
    totalPaymentAmount.value = 0.00;
    var data = CartController.to.myCardModel.value!.data!;
    for(var i in data){
      print("i.type!.toString() --- ${i.type!.toString()}");
      totalPaymentAmount.value += i.price!;
      subtotal.value += i.price!;
    }


    orderItems.clear();
    for(var i in CartController.to.myCardModel.value.data!){
      print("i.type!.toString() -- ${i.type!.toString()}");
      orderItems.add(  {
        "type": i.type!.toString(), // packages or semester
        "type_id": i.packagesId!.toString()
      });
    }

  }

  //apply coupon
  RxBool isCoupon = false.obs;
  Rx<CouponModel> couponModel = CouponModel().obs;
  applyCoupon()async{
    isCoupon.value = true;
    var response = await ApiServer.putApi(
      url: ApiConfig.APPLY_COUPON,
      body: {
        "code": couponCode.value.text
      }
    );
    var data = jsonDecode(response.body);
    if(response.statusCode == 200){
      couponModel.value = CouponModel.fromJson(data);
      totalDiscountAmount.value = double.parse("${data["data"]["discount"]}");
      totalPaymentAmount.value = totalPaymentAmount.value - totalDiscountAmount.value;
      Get.snackbar("Success!", "Coupon applied", backgroundColor: AppColor.primaryColor, colorText: AppColor.white);
    }else{
      Get.snackbar("Error!", "Coupon applied failed", backgroundColor:Colors.red, colorText: AppColor.white);
    }
    isCoupon.value = false;
  }
  
  
  // PLACE ORDER 
  RxBool isPlacingOrder = false.obs;
  placeOrder()async{
    isPlacingOrder.value = true;


    var data = {
      "c_number": whatsAppNumber.value.text,
      "sub_total": subtotal.value.toStringAsFixed(2),
      "tax": "0",
      "coupon_discount": couponModel.value.data == null ? "0.00" : couponModel.value.data!.discount!.toStringAsFixed(2),
      "total_price": totalPaymentAmount.value.toStringAsFixed(2),
      "coupon_code":  couponCode.value.text.isEmpty ? " " : couponCode.value.text,
      "orders_items": orderItems
    };
    print("place order data -- $data");
    var response = await ApiServer.postApi(
        url: ApiConfig.PLACE_ORDER,
        body: data
    );

    if(response.statusCode == 200){
      couponCode.value.clear();
      whatsAppNumber.value.clear();
      Get.snackbar("Success!", "Your order is placed", backgroundColor: AppColor.primaryColor, colorText: AppColor.white);
      Get.offAllNamed(Routes.BOTTOM_MENUS);
    }else{
      Get.snackbar("Error!", "Your order place failed", backgroundColor: Colors.red, colorText: AppColor.white);
    }
    isPlacingOrder.value = false;
  }


}
