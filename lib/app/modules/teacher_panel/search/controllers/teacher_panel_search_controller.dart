import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/bottom_navigations/home/controllers/home_controller.dart';
import 'package:kuwait_elearing/confim/api_config.dart';
import 'package:kuwait_elearing/confim/api_service.dart';

import '../model/all_assignment.dart';

class TeacherPanelSearchController extends GetxController {
  //TODO: Implement TeacherPanelSearchController

  final HomeController homeController = Get.put(HomeController());
  @override
  void onInit() {

    super.onInit();
    getAllAssignment(); //init
    // Wait a moment after widget builds
    ever(homeController.allUniversityCourseModel, (_) {
      if (homeController.allUniversityCourseModel.value.data != null) {
        setAllCourseName();
      }
    });
  }

  RxList<String> allCourses = <String>[].obs;
  setAllCourseName(){
    allCourses.clear();
      for(var i in homeController.allUniversityCourseModel.value.data!){
        allCourses.add(i.title!);
    }

      print("allCourses --- ${allCourses.value}");
  }

  Rx<TextEditingController> bidTextController = TextEditingController().obs;
  
  RxBool isGettingAllAssignment = false.obs;
  RxList<SingleAssignmentModel> allAssignmentListModel = <SingleAssignmentModel>[].obs;
  RxList<SingleAssignmentModel> searchAssignmentListModel = <SingleAssignmentModel>[].obs;
  //get all assignment for bid
  getAllAssignment()async{
    isGettingAllAssignment.value = true;
    allAssignmentListModel.clear();
    var response = await ApiServer.getApi(url: ApiConfig.ASSIGNMENT_ALL);
    if(response.statusCode == 200){
      var data = AllAssignmentListModel.fromJson(jsonDecode(response.body));
      for(var i in data.data!){
        allAssignmentListModel.value.add(i);
      }
    }
    isGettingAllAssignment.value = false;
  }

  RxString selectedAssignmentType = "".obs;
  RxString selectedAssignmentLevel = "".obs;
  RxString selectedAssignmentCourse = "".obs;
  //select assignment type
  selectAssignmentType(v) {
    selectedAssignmentType.value = v;
    searchAssignment();
  }

  //select assignment type
  selectLevel(v) {
    selectedAssignmentLevel.value = v;
    searchAssignment();
  }
  //select assignment course
  selectCourse(v) {
    selectedAssignmentCourse.value = v;
    searchAssignment();
  }

  //search by level, courses, type
  void searchAssignment() {
    print("Selected Course: ${selectedAssignmentCourse.value}");
    print("Selected Type: ${selectedAssignmentType.value}");
    print("Selected Level: ${selectedAssignmentLevel.value}");

    // Clear previous search results
    searchAssignmentListModel.clear();

    // Return early if the main list is empty
    if (allAssignmentListModel.isEmpty) {
      return;
    }

    // Check if at least one filter is selected
    final isFilterApplied = selectedAssignmentCourse.value.isNotEmpty ||
        selectedAssignmentType.value.isNotEmpty ||
        selectedAssignmentLevel.value.isNotEmpty;

    if (isFilterApplied) {
      // Loop through all assignments and apply filter
      for (var assignment in allAssignmentListModel) {
        final courseTitle = assignment.courses?.title?.toLowerCase() ?? "";
        final courseType = assignment.coursesType?.toLowerCase() ?? "";
        final courseLevel = "University" ?? "";

        final matchCourse = selectedAssignmentCourse.value.isEmpty ||
            courseTitle.contains(selectedAssignmentCourse.value.toLowerCase());

        final matchType = selectedAssignmentType.value.isEmpty ||
            courseType.contains(selectedAssignmentType.value.toLowerCase());

        final matchLevel = selectedAssignmentLevel.value.isEmpty ||
            courseLevel.contains(selectedAssignmentLevel.value.toLowerCase());

        // Add to result only if all selected filters match
        if (matchCourse && matchType && matchLevel) {
          searchAssignmentListModel.add(assignment);
        }
      }
    } else {
      // No filters applied: clear search result
      searchAssignmentListModel.clear();
    }

    print("Filtered assignments: ${searchAssignmentListModel.length}");
  }


  //refreshAssignments
  Future<void> refreshAssignments() async {
    await getAllAssignment(); // or your method to fetch all
    selectedAssignmentType.value = "";
    selectedAssignmentLevel.value = "";
    selectedAssignmentCourse.value = "";
    searchAssignmentListModel.value.clear();
  }



}
