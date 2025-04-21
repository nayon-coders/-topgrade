import 'dart:convert';

import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/bottom_navigations/my_orders/model/my_order_model.dart';
import 'package:kuwait_elearing/confim/api_config.dart';
import 'package:kuwait_elearing/confim/api_service.dart';
import 'package:kuwait_elearing/utility/app_json.dart';

class BottomNavigationsMyOrdersController extends GetxController {
  //TODO: Implement BottomNavigationsMyOrdersController

  final count = 0.obs;
  @override
  void onInit() {
    getMyOrdersList();
    super.onInit();
  }
  RxBool isAssignment = true.obs;
  changeTab(value)=> isAssignment.value = value;

  
  RxBool isLoading = false.obs; 
  RxList<MyOrderModel> myAssignmentOrderListModel = <MyOrderModel>[].obs;
  Rx<MyOrderModel> myCourseOrderListModel = MyOrderModel().obs;
  void getMyOrdersList ()async{
    isLoading.value = true;
    var response = await ApiServer.getApi(url: ApiConfig.MY_ORDER);
    if(response.statusCode == 200){
      myCourseOrderListModel.value = jsonDecode(response.body);
    }
    isLoading.value = false;
  }
}
