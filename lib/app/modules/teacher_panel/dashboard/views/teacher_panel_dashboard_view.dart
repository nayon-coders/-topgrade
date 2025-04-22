import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../utility/app_color.dart';
import '../controllers/teacher_panel_dashboard_controller.dart';

class TeacherPanelDashboardView
    extends GetView<TeacherPanelDashboardController> {
  const TeacherPanelDashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.selectPageIndex.value = Get.arguments ?? 0;
    return Scaffold(
      body: Obx(() {
        //return controller.pages.value[1];
        return controller.pages.value[controller.selectPageIndex.value];
      }
      ),
      bottomNavigationBar: TeacherAppBottomMenu(),
    );
  }
}
class TeacherAppBottomMenu extends GetView<TeacherPanelDashboardController> {
  const TeacherAppBottomMenu({
    super.key,
    // required this.controller,
  });


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: 100,
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(width: 1, color: Colors.black)
            )
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'My Orders'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.chat_outlined), label: 'Chat'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My Account'),
          ],
          currentIndex: controller.selectPageIndex.value,
          selectedItemColor: AppColor.primaryColor,
          onTap: (index)=> controller.onPageChange(index),
        ),
      );
    }
    );
  }
}

