import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuwait_elearing/app/routes/app_pages.dart';
import 'package:kuwait_elearing/utility/app_assets.dart';

import '../../../../../utility/app_color.dart';
import '../../../../widgets/app_button.dart';
import '../../../../widgets/app_input.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.only(top: 70),
        decoration: BoxDecoration(
          gradient: AppColor.primaryGradient,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //logo 
              Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 50,
                    child: Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(100)
                      ),
                      child: Center(
                        child: Text("ENG/AR",
                          style: GoogleFonts.finlandica(
                            color: AppColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Image.asset(AppAssets.logo, height: 200, width: Get.width, fit: BoxFit.cover,),
                ],
              ),
          
              SizedBox(height: 30,),
              //login form
              Center(
                child: Text("Login",
                  style: GoogleFonts.finlandica(
                    color: AppColor.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ),
            
              Form(
                key: controller.loginFormKey.value,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      AppInput(
                        title: "Email",
                        hintText: "Enter your email",
                        controller: controller.emailController.value,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 15,),
                      AppInput(
                        title: "Password",
                        hintText: "Enter your password",
                        controller: controller.passwordController.value,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: ()=>Get.toNamed(Routes.FORGET_PASSWORD),
                          child: Text("Forgot your password?",
                            style: GoogleFonts.finlandica(
                              color: AppColor.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Obx((){
                          return AppButton(
                            isLoading: controller.isEmailLogin.value,
                            title: "Sign in",
                            onTap: (){
                              if(controller.loginFormKey.value.currentState!.validate()){
                                controller.loginWithEmail();
                                return;
                              }else{
                                return;
                              }

                            },
                          );
                        }
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10, bottom: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 3,
                            color: AppColor.primaryColor,
                          ),
                        ),
                        SizedBox(width: 10,),
                        Text("Or",
                          style: GoogleFonts.finlandica(
                            color: AppColor.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Container(
                              height: 3,
                              color: AppColor.primaryColor,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    Obx((){
                        return SocailSigninButton(
                          isLoading: controller.isLoginWithEmail.value,
                          icon: FontAwesomeIcons.google,
                          title: "Sign in with Google",
                          onTap: ()async{
                            await controller.signInWithGoogle();
                          },
                        );
                      }
                    ),
                    SizedBox(height: 10,),
                    SocailSigninButton(
                      icon: FontAwesomeIcons.apple,
                      title: "Sign in with Apple",
                      onTap: ()async{
                        await controller.signInWithApple();
                      },
                    ),
                    SizedBox(height: 10,),
                    SocailSigninButton(
                      title: "Sign up using Email",
                      onTap: ()=>Get.toNamed(Routes.SIGNUP),
                    ),
                    SizedBox(height: 20,),
          
          
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 20),
                child: Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Need help",
                      style: GoogleFonts.finlandica(
                          color: AppColor.primaryColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    SizedBox(width: 5,),
                    FaIcon(FontAwesomeIcons.phone, color: AppColor.primaryColor,),
                  ],
                ),
              ),
              SizedBox(height: 30,),
            ],
          ),
        ),

      )
    );
  }
}

class SocailSigninButton extends StatelessWidget {
  const SocailSigninButton({
    super.key, required this.title, required this.onTap,  this.icon, this.isLoading = false
  });
  final String title;
  final VoidCallback onTap;
  final IconData? icon;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:  onTap,
      child: Container(
        width: 250,
        height: 45,
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: isLoading ? Center(child: CircularProgressIndicator.adaptive(backgroundColor: AppColor.white,),) : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon == null ? Center() : FaIcon(icon, color: AppColor.white,),
            SizedBox(width: 10,),
            Text(title,
              style: GoogleFonts.finlandica(
                color: AppColor.white,
                fontSize: 16,
                fontWeight: FontWeight.w700
              ),
            )
          ],
        ),
      ),
    );
  }
}


