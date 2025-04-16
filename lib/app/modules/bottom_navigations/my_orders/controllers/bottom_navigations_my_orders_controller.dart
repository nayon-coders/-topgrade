import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/bottom_navigations/my_orders/model/my_order_model.dart';
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

  RxList<MyOrderModel> myAssignmentOrderListModel = <MyOrderModel>[].obs;
  RxList<MyOrderModel> myCourseOrderListModel = <MyOrderModel>[].obs;
  void getMyOrdersList ()async{
      for(var i in my_orders){
        if(i["type"] == "course"){
          myCourseOrderListModel.value.add(MyOrderModel.fromJson(i));
        }
        if(i["type"] == "assignment"){
          myAssignmentOrderListModel.value.add(MyOrderModel.fromJson(i));
        }
      }
  }
}
