import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/teacher_panel_my_account_controller.dart';

class TeacherPanelMyAccountView
    extends GetView<TeacherPanelMyAccountController> {
  const TeacherPanelMyAccountView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TeacherPanelMyAccountView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TeacherPanelMyAccountView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
