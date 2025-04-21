import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kuwait_elearing/utility/app_color.dart';

import '../controllers/bottom_menus_controller.dart';

class BottomMenusView extends GetView<BottomMenusController> {
  const BottomMenusView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.selectPageIndex.value = int.tryParse(Get.arguments?.toString() ?? "0") ?? 0;
    return Scaffold(
      body: Obx(() {
          return controller.pages.value[controller.selectPageIndex.value];
        }
      ),
      bottomNavigationBar: AppBottomMenu(),
    );
  }
}

class AppBottomMenu extends GetView<BottomMenusController> {
  const AppBottomMenu({
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
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
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
