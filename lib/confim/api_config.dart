import 'package:flutter/material.dart';
class ApiConfig{
  static final String DOMAIN = "https://education-management-backend-8jm1.onrender.com";
  static final String API_VERSION = "api/v1";
  static final String BASE_URL = "$DOMAIN/$API_VERSION";


  static final String LOGIN = "$BASE_URL/user/login";
  static final String SIGNUP = "$BASE_URL/user/signup";
  static final String MY_ACCOUNT  = "$BASE_URL/user/me";
  static final String UPDATE_USER  = "$BASE_URL/user/update";
  static final String SINGLE_USER  = "$BASE_URL/user/";
  static final String SOCIAL_MEDIA  = "$BASE_URL/user/socail-media";
  static final String EMAIL_VERIFY  = "$BASE_URL/forgot/forgot-password";
  static final String OTP_VERIFY  = "$BASE_URL/forgot/verify-reset-code";
  static final String RESET_PASSWORD  = "$BASE_URL/forgot/new-password";


  static final String UNIVERSITY_ALL_COURSE  = "$BASE_URL/courses/all?status=Active&order=desc";
  static final String UNIVERSITY_ALL_COURSE_TOPICS  = "$BASE_URL/courses/with-topic/";
  static final String UNIVERSITY_ALL_COURSE_TOPICS_TEACHER  = "$BASE_URL/courses-topic/";
  static final String UNIVERSITY_SINGLE_COURSE_DETAILS  = "$BASE_URL/courses-deatials/";


  static final String ADD_CART  = "$BASE_URL/card/add";
  static final String GET_CART  = "$BASE_URL/card/my";
  static final String DELETE_CART  = "$BASE_URL/card/delete/";
  static final String APPLY_COUPON  = "$BASE_URL/coupon/check";
  static final String PLACE_ORDER  = "$BASE_URL/order/create";
  static final String MY_ORDER  = "$BASE_URL/order/check2";


  static final String CREATE_ASSIGNMET  = "$BASE_URL/assignment/create";
  static final String ASSIGNMENT_ALL  = "$BASE_URL/assignment/all?order=desc";
}