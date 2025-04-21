import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/cart/model/car_model.dart';

import '../../../../confim/api_config.dart';
import '../../../../confim/api_service.dart';
import '../../../../utility/app_color.dart';

class CartController extends GetxController {
  //TODO: Implement CartController

  static CartController get to => Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMyCardItems();
  }

  RxBool isLoading = false.obs;
  // add to cart
  addToCart(id, type)async{
    isLoading.value = true;
    var response = await ApiServer.postApi(
        url: ApiConfig.ADD_CART,
        body: {
          "type": type, // packages or semester
          "type_id": id
        }
    );
    if(response.statusCode == 200){
      Get.snackbar("Success!", "Add to cart success!", backgroundColor: AppColor.primaryColor, colorText: Colors.white);
      getMyCardItems();
    }else{
      Get.snackbar("Error!", "Add to cart failed!", backgroundColor: Colors.red, colorText: Colors.white);
    }
    isLoading.value = false;
  }

  Rx<MyCardModel> myCardModel = MyCardModel().obs;
  //get my card
  getMyCardItems()async{
    isLoading.value = true;
    var response = await ApiServer.getApi(url: ApiConfig.GET_CART);
    if(response.statusCode == 200){
      myCardModel.value = MyCardModel.fromJson(jsonDecode(response.body));
    }
    isLoading.value = false;
  }

  //delete card item
  deleteCard(id)async{
    var response = await ApiServer.deleteApi(url: ApiConfig.DELETE_CART+"$id");
    if(response.statusCode == 200){
      getMyCardItems();
    }
  }
}
