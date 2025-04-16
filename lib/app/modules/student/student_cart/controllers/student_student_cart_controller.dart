import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class StudentStudentCartController extends GetxController {
  //TODO: Implement StudentStudentCartController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }
  var cartFormKey = GlobalKey<FormState>().obs;
  Rx<TextEditingController> cityTextEditingController = TextEditingController().obs;
  Rx<TextEditingController> block1TextEditingController = TextEditingController().obs;
  Rx<TextEditingController> block2TextEditingController = TextEditingController().obs;
  Rx<TextEditingController> floorTextEditingController = TextEditingController().obs;
  Rx<TextEditingController> avenueTextEditingController = TextEditingController().obs;
  Rx<TextEditingController> contactTextEditingController = TextEditingController().obs;
}
