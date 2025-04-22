import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kuwait_elearing/app/modules/bottom_navigations/home/model/all_university_course_model.dart';
import 'package:kuwait_elearing/app/routes/app_pages.dart';
import 'package:kuwait_elearing/confim/api_config.dart';
import 'package:kuwait_elearing/confim/api_service.dart';
import 'package:kuwait_elearing/main.dart';
import 'package:kuwait_elearing/utility/app_color.dart';
import 'package:kuwait_elearing/utility/app_const.dart';
import 'dart:io';
import 'package:path/path.dart';

import 'package:http/http.dart' as http;
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
  RxString selectedAssignmentType  = "".obs;

  final SingleUniversityCourseItem selectedCourse = Get.arguments;



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

  var selectedFile;
  //Attach file
  void attachFile()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      selectedAttachFile.value.text = file.name;
      selectedFile = file;
      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);
    } else {
      // User canceled the picker
    }
  }



  RxBool isLoading = false.obs;
  //submit the assignment
  void submitAssignment() async {
    isLoading.value = true;

    final uri = Uri.parse(ApiConfig.CREATE_ASSIGNMET);
    var request = http.MultipartRequest('POST', uri);

    request.fields['courses_id'] = selectedCourse.id.toString();
    request.fields['courses_type'] = selectedAssignmentType.value;
    request.fields['date'] = selectedDueDate.value.text;
    request.fields['description'] = description.value.text;
    request.headers['Authorization'] = 'Bearer ${sharedPreferences!.getString(AppConst.TOKEN)}';

    if (selectedFile?.path != null) {
      File file = File(selectedFile!.path!); // Convert PlatformFile to File
      var stream = http.ByteStream(file.openRead());
      var length = await file.length();

      var multipartFile = http.MultipartFile(
        'file',
        stream,
        length,
        filename: basename(file.path),
      );

      request.files.add(multipartFile);
    } else {
      print("❗ No file selected.");
    }

    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        print('✅ Upload successful!');
        final responseData = await response.stream.bytesToString();
        Get.snackbar("Success!", "Assignment submitted success!", backgroundColor: AppColor.primaryColor, colorText: AppColor.white);
        Get.toNamed(Routes.BOTTOM_MENUS);
        print(responseData);
      } else {
        print('❌ Upload failed: ${response.statusCode}');
      }
    } catch (e) {
      print('❌ Upload error: $e');
    }

    isLoading.value = false;
  }




}
