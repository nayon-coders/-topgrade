import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CoursesSubmitAssignmentController extends GetxController {
  //TODO: Implement CoursesSubmitAssignmentController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }


  Rx<TextEditingController> selectedDueDate = TextEditingController().obs;
  Rx<TextEditingController> selectedAttachFile = TextEditingController().obs;
  Rx<TextEditingController> description = TextEditingController().obs;
  RxString selectedCourse  = "".obs;
  RxString selectedAssignmentType  = "".obs;

  //select course
  void selectCourses(v){
    selectedCourse.value = v;
  }

  //select assignment type
  void selectAssignmentType(v){
    selectedAssignmentType.value = v;
  }

  //selected due date
  Future<void> selectDeuDate(context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2200),
    );
    selectedDueDate.value.text = "${pickedDate!.day}/${pickedDate!.month}/${pickedDate!.year}";
    print("selectedDueDate.value.text -- ${selectedDueDate.value.text}");
    update();
  }

  //Attach file
  void attachFile()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      selectedAttachFile.value.text = file.name;
      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);
    } else {
      // User canceled the picker
    }
  }



}
