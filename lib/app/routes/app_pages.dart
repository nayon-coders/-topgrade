import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuwait_elearing/app/middleware/auth_middleware.dart';
import 'package:kuwait_elearing/app/modules/checkout/views/payment.dart';

import '../modules/assignment_order_details/bindings/assignment_order_details_binding.dart';
import '../modules/assignment_order_details/views/assignment_order_details_view.dart';
import '../modules/auth/forget_password/bindings/forget_password_binding.dart';
import '../modules/auth/forget_password/views/forget_password_view.dart';
import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/otp/bindings/otp_binding.dart';
import '../modules/auth/otp/views/otp_view.dart';
import '../modules/auth/reset_password/bindings/reset_password_binding.dart';
import '../modules/auth/reset_password/views/reset_password_view.dart';
import '../modules/auth/reset_password_seccess/bindings/reset_password_seccess_binding.dart';
import '../modules/auth/reset_password_seccess/views/reset_password_seccess_view.dart';
import '../modules/auth/signup/bindings/signup_binding.dart';
import '../modules/auth/signup/views/signup_view.dart';
import '../modules/bottom_navigations/bottom_menus/bindings/bottom_menus_binding.dart';
import '../modules/bottom_navigations/bottom_menus/views/bottom_menus_view.dart';
import '../modules/bottom_navigations/chat/bindings/bottom_navigations_chat_binding.dart';
import '../modules/bottom_navigations/chat/views/bottom_navigations_chat_view.dart';
import '../modules/bottom_navigations/home/bindings/home_binding.dart';
import '../modules/bottom_navigations/home/views/home_view.dart';
import '../modules/bottom_navigations/my_account/bindings/bottom_navigations_my_account_binding.dart';
import '../modules/bottom_navigations/my_account/views/bottom_navigations_my_account_view.dart';
import '../modules/bottom_navigations/my_orders/bindings/bottom_navigations_my_orders_binding.dart';
import '../modules/bottom_navigations/my_orders/views/bottom_navigations_my_orders_view.dart';
import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/change_password/bindings/change_password_binding.dart';
import '../modules/change_password/views/change_password_view.dart';
import '../modules/checkout/bindings/checkout_binding.dart';
import '../modules/checkout/views/checkout_view.dart';
import '../modules/course_order_details/bindings/course_order_details_binding.dart';
import '../modules/course_order_details/views/course_order_details_view.dart';
import '../modules/courses/cource_topics/bindings/courses_cource_topics_binding.dart';
import '../modules/courses/cource_topics/views/courses_cource_topics_view.dart';
import '../modules/courses/course_content/bindings/courses_course_content_binding.dart';
import '../modules/courses/course_content/views/courses_course_content_view.dart';
import '../modules/courses/course_video_overview/bindings/courses_course_video_overview_binding.dart';
import '../modules/courses/course_video_overview/views/courses_course_video_overview_view.dart';
import '../modules/courses/single_course/bindings/courses_single_course_binding.dart';
import '../modules/courses/single_course/views/courses_single_course_view.dart';
import '../modules/courses/single_course_instractor/bindings/courses_single_course_instractor_binding.dart';
import '../modules/courses/single_course_instractor/views/courses_single_course_instractor_view.dart';
import '../modules/courses/submit_assignment/bindings/courses_submit_assignment_binding.dart';
import '../modules/courses/submit_assignment/views/courses_submit_assignment_view.dart';
import '../modules/edit_account_info/bindings/edit_account_info_binding.dart';
import '../modules/edit_account_info/views/edit_account_info_view.dart';
import '../modules/student/home_tutoring/bindings/student_home_tutoring_binding.dart';
import '../modules/student/home_tutoring/views/student_home_tutoring_view.dart';
import '../modules/student/single_course/bindings/student_single_course_binding.dart';
import '../modules/student/single_course/views/student_single_course_view.dart';
import '../modules/student/student_cart/bindings/student_student_cart_binding.dart';
import '../modules/student/student_cart/views/student_student_cart_view.dart';
import '../modules/student/student_checkout/bindings/student_student_checkout_binding.dart';
import '../modules/student/student_checkout/views/student_student_checkout_view.dart';
import '../modules/student/study_note/bindings/student_study_note_binding.dart';
import '../modules/student/study_note/views/student_study_note_view.dart';
import '../modules/student/tutoring_details/bindings/student_tutoring_details_binding.dart';
import '../modules/student/tutoring_details/views/student_tutoring_details_view.dart';
import '../modules/teacher_panel/chat/bindings/teacher_panel_chat_binding.dart';
import '../modules/teacher_panel/chat/views/teacher_panel_chat_view.dart';
import '../modules/teacher_panel/dashboard/bindings/teacher_panel_dashboard_binding.dart';
import '../modules/teacher_panel/dashboard/views/teacher_panel_dashboard_view.dart';
import '../modules/teacher_panel/my_account/bindings/teacher_panel_my_account_binding.dart';
import '../modules/teacher_panel/my_account/views/teacher_panel_my_account_view.dart';
import '../modules/teacher_panel/my_order/bindings/teacher_panel_my_order_binding.dart';
import '../modules/teacher_panel/my_order/views/teacher_panel_my_order_view.dart';
import '../modules/teacher_panel/order_details/bindings/teacher_panel_order_details_binding.dart';
import '../modules/teacher_panel/order_details/views/teacher_panel_order_details_view.dart';
import '../modules/teacher_panel/search/bindings/teacher_panel_search_binding.dart';
import '../modules/teacher_panel/search/views/teacher_panel_search_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ROOT_CHECKER;

  static final routes = [
    GetPage(
      name: Routes.ROOT_CHECKER,
      page: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      middlewares: [AuthMiddleware()],
    ),

    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
    //  middlewares: [AuthMiddleware()],
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.FORGET_PASSWORD,
      page: () => const ForgetPasswordView(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () =>  OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD_SECCESS,
      page: () => const ResetPasswordSeccessView(),
      binding: ResetPasswordSeccessBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAVIGATIONS_CHAT,
      page: () => const BottomNavigationsChatView(),
      binding: BottomNavigationsChatBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAVIGATIONS_MY_ACCOUNT,
      page: () => const BottomNavigationsMyAccountView(),
      binding: BottomNavigationsMyAccountBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_MENUS,
      page: () => const BottomMenusView(),
      bindings: [
        BottomMenusBinding(),
        BottomNavigationsChatBinding(),
        BottomNavigationsMyAccountBinding(),
        BottomNavigationsMyOrdersBinding(),
        HomeBinding()
      ],
    ),
    GetPage(
      name: _Paths.BOTTOM_NAVIGATIONS_MY_ORDERS,
      page: () => const BottomNavigationsMyOrdersView(),
      binding: BottomNavigationsMyOrdersBinding(),
    ),
    GetPage(
      name: _Paths.SINGLE_COURSE,
      page: () => const CoursesSingleCourseView(),
      binding: CoursesSingleCourseBinding(),
    ),
    GetPage(
      name: _Paths.STUDENT_SINGLE_COURSE,
      page: () => const StudentSingleCourseView(),
      binding: StudentSingleCourseBinding(),
    ),
    GetPage(
      name: _Paths.COURSES_SUBMIT_ASSIGNMENT,
      page: () => const CoursesSubmitAssignmentView(),
      binding: CoursesSubmitAssignmentBinding(),
    ),
    GetPage(
      name: _Paths.COURSES_COURCE_TOPICS,
      page: () => const CoursesCourceTopicsView(),
      binding: CoursesCourceTopicsBinding(),
    ),
    GetPage(
      name: _Paths.COURSES_SINGLE_COURSE_INSTRACTOR,
      page: () => const CoursesSingleCourseInstractorView(),
      binding: CoursesSingleCourseInstractorBinding(),
    ),
    GetPage(
      name: _Paths.COURSES_COURSE_CONTENT,
      page: () => const CoursesCourseContentView(),
      binding: CoursesCourseContentBinding(),
    ),
    GetPage(
      name: _Paths.COURSES_COURSE_VIDEO_OVERVIEW,
      page: () =>  CoursesCourseVideoOverviewView(),
      binding: CoursesCourseVideoOverviewBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.CHECKOUT,
      page: () => const CheckoutView(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => const Payment(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: _Paths.STUDENT_STUDY_NOTE,
      page: () => const StudentStudyNoteView(),
      binding: StudentStudyNoteBinding(),
    ),
    GetPage(
      name: _Paths.STUDENT_HOME_TUTORING,
      page: () => const StudentHomeTutoringView(),
      binding: StudentHomeTutoringBinding(),
    ),
    GetPage(
      name: _Paths.STUDENT_TUTORING_DETAILS,
      page: () => const StudentTutoringDetailsView(),
      binding: StudentTutoringDetailsBinding(),
    ),
    GetPage(
      name: _Paths.STUDENT_STUDENT_CART,
      page: () => const StudentStudentCartView(),
      binding: StudentStudentCartBinding(),
    ),
    GetPage(
      name: _Paths.STUDENT_STUDENT_CHECKOUT,
      page: () => const StudentStudentCheckoutView(),
      binding: StudentStudentCheckoutBinding(),
    ),
    GetPage(
      name: _Paths.ASSIGNMENT_ORDER_DETAILS,
      page: () => const AssignmentOrderDetailsView(),
      binding: AssignmentOrderDetailsBinding(),
    ),
    GetPage(
      name: _Paths.COURSE_ORDER_DETAILS,
      page: () => const CourseOrderDetailsView(),
      binding: CourseOrderDetailsBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_ACCOUNT_INFO,
      page: () => const EditAccountInfoView(),
      binding: EditAccountInfoBinding(),
      children: [
        GetPage(
          name: _Paths.EDIT_ACCOUNT_INFO,
          page: () => const EditAccountInfoView(),
          binding: EditAccountInfoBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.TEACHER_PANEL_DASHBOARD,
      page: () => const TeacherPanelDashboardView(),
      bindings: [TeacherPanelDashboardBinding(), BottomNavigationsMyAccountBinding(), TeacherPanelChatBinding(), TeacherPanelMyOrderBinding() ],
    ),
    GetPage(
      name: _Paths.TEACHER_PANEL_MY_ORDER,
      page: () => const TeacherPanelMyOrderView(),
      binding: TeacherPanelMyOrderBinding(),
    ),
    GetPage(
      name: _Paths.TEACHER_PANEL_SEARCH,
      page: () => const TeacherPanelSearchView(),
      binding: TeacherPanelSearchBinding(),
    ),
    GetPage(
      name: _Paths.TEACHER_PANEL_CHAT,
      page: () => const TeacherPanelChatView(),
      binding: TeacherPanelChatBinding(),
    ),
    GetPage(
      name: _Paths.TEACHER_PANEL_MY_ACCOUNT,
      page: () => const TeacherPanelMyAccountView(),
      binding: TeacherPanelMyAccountBinding(),
    ),
    GetPage(
      name: _Paths.TEACHER_PANEL_ORDER_DETAILS,
      page: () => const TeacherPanelOrderDetailsView(),
      binding: TeacherPanelOrderDetailsBinding(),
    ),
  ];
}
