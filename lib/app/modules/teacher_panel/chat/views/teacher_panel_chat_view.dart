import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/teacher_panel_chat_controller.dart';

class TeacherPanelChatView extends GetView<TeacherPanelChatController> {
  const TeacherPanelChatView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TeacherPanelChatView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TeacherPanelChatView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
