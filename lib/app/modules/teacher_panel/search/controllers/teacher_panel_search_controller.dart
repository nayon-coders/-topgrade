import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeacherPanelSearchController extends GetxController {
  //TODO: Implement TeacherPanelSearchController

  final count = 0.obs;
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

  void increment() => count.value++;
  Rx<TextEditingController> bidTextController = TextEditingController().obs;

}
