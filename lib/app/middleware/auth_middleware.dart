import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuwait_elearing/main.dart';
import '../../utility/app_const.dart';
import '../routes/app_pages.dart';
class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final token = sharedPreferences!.getString(AppConst.TOKEN);
    final role = sharedPreferences!.getString(AppConst.ROLE);

    // ⚠️ Prevent infinite loop: If already on LOGIN route, don't redirect again
    if (route == Routes.LOGIN) {
      return null;
    }

    if (token == null || token.isEmpty) {
      return const RouteSettings(name: Routes.LOGIN);
    }

    if (role == 'Student') {
      return const RouteSettings(name: Routes.BOTTOM_MENUS);
    } else if (role == 'Teacher') {
      return const RouteSettings(name: Routes.TEACHER_PANEL_DASHBOARD);
    }

    return null;
  }
}

