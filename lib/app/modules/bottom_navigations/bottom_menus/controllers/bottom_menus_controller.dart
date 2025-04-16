import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/bottom_navigations/chat/views/bottom_navigations_chat_view.dart';
import 'package:kuwait_elearing/app/modules/bottom_navigations/home/views/home_view.dart';
import 'package:kuwait_elearing/app/modules/bottom_navigations/my_account/views/bottom_navigations_my_account_view.dart';
import 'package:kuwait_elearing/app/modules/bottom_navigations/my_orders/views/bottom_navigations_my_orders_view.dart';
import 'package:kuwait_elearing/app/modules/bottom_navigations/search/views/bottom_navigations_search_view.dart';
import 'package:kuwait_elearing/app/routes/app_pages.dart';

class BottomMenusController extends GetxController {
  //TODO: Implement BottomMenusController

  final selectPageIndex = 0.obs;

  Rx<Widget> selectPage = HomeView().obs;
  RxList<Widget> pages = <Widget>[
    HomeView(),
    BottomNavigationsMyOrdersView(),
    BottomNavigationsSearchView(),
    BottomNavigationsChatView(),
    BottomNavigationsMyAccountView(),

  ].obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  void onPageChange(selectPage){
    selectPageIndex.value = selectPage;
    if(Get.currentRoute != Routes.BOTTOM_MENUS){
      Get.toNamed(Routes.BOTTOM_MENUS, arguments: selectPage);
    }

  }
}
