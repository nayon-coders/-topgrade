import 'package:get/get.dart';

class CoursesCourseContentController extends GetxController {
  //TODO: Implement CoursesCourseContentController

  @override
  void onInit() {
    super.onInit();
  }

  RxBool isPackage = true.obs;
  RxBool isSemester = false.obs;
  void changePackage(value)=>isPackage.value = value;
}
