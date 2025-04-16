import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/bottom_navigations/search/views/bottom_navigations_search_view.dart';
import 'package:kuwait_elearing/app/modules/teacher_panel/my_order/views/teacher_panel_my_order_view.dart';
import 'package:kuwait_elearing/app/modules/teacher_panel/search/views/teacher_panel_search_view.dart';

import '../../../../routes/app_pages.dart';
import '../../../bottom_navigations/chat/views/bottom_navigations_chat_view.dart';
import '../../../bottom_navigations/my_account/views/bottom_navigations_my_account_view.dart';

class TeacherPanelDashboardController extends GetxController {
  //TODO: Implement TeacherPanelDashboardController


  final selectPageIndex = 0.obs;

  Rx<Widget> selectPage = TeacherPanelMyOrderView().obs;
  RxList<Widget> pages = <Widget>[
    TeacherPanelMyOrderView(),
    TeacherPanelSearchView(),
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
    if(Get.currentRoute != Routes.TEACHER_PANEL_DASHBOARD){
      Get.toNamed(Routes.TEACHER_PANEL_DASHBOARD, arguments: selectPage);
    }

  }
}
