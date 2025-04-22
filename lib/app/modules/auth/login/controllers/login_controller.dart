import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kuwait_elearing/app/routes/app_pages.dart';
import 'package:kuwait_elearing/confim/api_config.dart';
import 'package:kuwait_elearing/confim/api_service.dart';
import 'package:http/http.dart' as http;
import 'package:kuwait_elearing/main.dart';
import 'package:kuwait_elearing/utility/app_color.dart';
import 'package:kuwait_elearing/utility/app_const.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
class LoginController extends GetxController {
  //TODO: Implement LoginController

  var loginFormKey = GlobalKey<FormState>().obs;
  RxString teacherEmail = "teacher@gmail.com".obs;
  RxString studentEmail = "student@gmail.com".obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }
  //input controller
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;

  //LOGIN WITH EMAIL
  RxBool isEmailLogin = false.obs;
  Future loginWithEmail()async{
    isEmailLogin.value = true;
    var response = await ApiServer.withoutPostApi(url: ApiConfig.LOGIN,
      body: {
        "email": emailController.value.text,
        "password": passwordController.value.text
      }
    );
    var data = jsonDecode(response.body);
    if(response.statusCode == 200){
      isEmailLogin.value = false;
      sharedPreferences!.setString(AppConst.USER_ID, data["data"]["user"]["id"].toString());
      sharedPreferences!.setString(AppConst.ROLE, data["data"]["user"]["role"]);
      sharedPreferences!.setString(AppConst.TOKEN, data["data"]["token"]);
      //redirect
     //check account is active or not
      if(data["data"]["user"]["status"] == "Active"){
        if(data["data"]["user"]["role"] == "Student"){
          Get.offAllNamed(Routes.BOTTOM_MENUS);
        }else{
          Get.offAllNamed(Routes.TEACHER_PANEL_DASHBOARD);
        }
        Get.snackbar("Login", "Login success!", backgroundColor: AppColor.primaryColor, colorText: AppColor.white);
      }else{
        Get.snackbar("Failed!", "Account is ${data["data"]["user"]["status"]}", backgroundColor: Colors.red, colorText: AppColor.white);
      }
    }else{
      isEmailLogin.value = false;
      Get.snackbar("Error!", "${data["error"]}", backgroundColor: AppColor.primaryColor, colorText: AppColor.white);
    }
  }

  // login with gmail
  /// we are login with gmail here throw [firebase]
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  var isLoginWithEmail = false.obs;
  Future<void> signInWithGoogle() async {
    //signOut();
    try {
      isLoginWithEmail.value = true;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        Get.snackbar("Cancelled", "Google sign-in cancelled", backgroundColor: Colors.red, colorText: AppColor.white);
        isLoginWithEmail.value = false;
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      var data = await _auth.signInWithCredential(credential);
      final firebaseUser = data.user;
      final firebaseIdToken = await firebaseUser?.getIdToken();
      debugPrint("firebaseIdToken--- ${firebaseIdToken}");
      if (firebaseUser != null) {
        await loginWithSocialMedia(firebaseIdToken);
      }
      // Navigate to Home
      // Get.offAll(() => HomeScreen());

    } catch (e) {
      print("google login error--- ${e}");
      Get.snackbar("Error", e.toString(),  backgroundColor: Colors.red, colorText: AppColor.white);
    } finally {
      isLoginWithEmail.value = false;
    }
  }

  //sign in with apple
  var isLoginWithApple = false.obs;

  signInWithApple() async {
    isLoginWithApple.value = true;
    // Request Apple credential
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    // Create OAuthCredential for Firebase
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      accessToken: appleCredential.authorizationCode,
    );

    var data = await _auth.signInWithCredential(oauthCredential);
    final firebaseUser = data.user;
    final firebaseIdToken = await firebaseUser?.getIdToken();
    debugPrint("firebaseIdToken--- ${firebaseIdToken}");
    if (firebaseUser != null) {
      await loginWithSocialMedia(firebaseIdToken);
    }
    isLoginWithApple.value = false;
    // Navigate to Home
    // Get.offAll(() => HomeScreen());

    // Sign in with Firebase
  }

  //logn with social media
  loginWithSocialMedia(token)async{

    isLoginWithEmail.value = true;
    var response = await ApiServer.withoutPostApi(
      url: ApiConfig.SOCIAL_MEDIA,
      body: {
        "role" : "Student",
        "token" : token
      }
    );
    var data = jsonDecode(response.body);

    if(response.statusCode == 200){
      sharedPreferences!.setString(AppConst.USER_ID, data["data"]["user"]["id"].toString());
      sharedPreferences!.setString(AppConst.ROLE, data["data"]["user"]["role"]);
      sharedPreferences!.setString(AppConst.TOKEN, data["data"]["token"]);
      //redirect
      //check account is active or not
      if(data["data"]["user"]["status"] == "Active"){
        if(data["data"]["user"]["role"] == "Student"){
          Get.offAllNamed(Routes.BOTTOM_MENUS);
        }else{
          Get.offAllNamed(Routes.TEACHER_PANEL_DASHBOARD);
        }
        Get.snackbar("Login", "Login success!", backgroundColor: AppColor.primaryColor, colorText: AppColor.white);
      }else{
        Get.snackbar("Failed!", "Account is ${data["data"]["user"]["status"]}", backgroundColor: Colors.red, colorText: AppColor.white);
      }

    }
  }


  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }



}
