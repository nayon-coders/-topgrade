import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuwait_elearing/app/routes/app_pages.dart';
import 'package:kuwait_elearing/app/widgets/app_button.dart';
import 'package:kuwait_elearing/app/widgets/app_input.dart';

import '../../../../../utility/app_assets.dart';
import '../../../../../utility/app_color.dart';
import '../../../../../utility/app_json.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
   SignupView({super.key});

  List<Map<String, String>> filteredCountries = List.from(countries);
  Map<String, String>? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColor.white,),
          onPressed: (){
            Get.back();
          },
        ),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          gradient: AppColor.primaryGradient,
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Image.asset(AppAssets.logo, height: 150, width: Get.width, fit: BoxFit.cover,),
              
              //form 
              Form(
                key: controller.signupKey.value,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppInput(
                        title: "First Name",
                        hintText: "First name",
                        controller: controller.firstNameController.value
                    ),
                    SizedBox(height: 15,),
                    AppInput(
                        title: "Last Name",
                        hintText: "Last name",
                        controller: controller.lastNameController.value
                    ),
                    SizedBox(height: 15,),
                    AppInput(
                        title: "Email",
                        hintText: "Email",
                        controller: controller.emailController.value
                    ),
                    SizedBox(height: 15,),
                    AppInput(
                        title: "Password",
                        hintText: "Password",
                        controller: controller.passwordController.value
                    ),
                    SizedBox(height: 15,),
                    AppInput(
                        title: "Re-type Password",
                        hintText: "Re-type Password",
                        controller: controller.confirmPasswordController.value
                    ),
                    SizedBox(height: 15,),
                    AppInput(
                        title: "Country",
                        hintText: "Country",
                        controller: controller.country.value
                    ),
                    SizedBox(height: 15,),
                    AppInput(
                        title: "Phone",
                        hintText: "",
                        controller: controller.phoneController.value,
                        keyboardType: TextInputType.phone,

                      prefixIcon: Container(
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Text("🇰🇼",
                            style: GoogleFonts.finlandica(
                              color: AppColor.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Center(
                        child: Obx(() {
                            return AppButton(
                              isLoading: controller.isSignUp.value,
                                title: "Sign Up",
                                onTap: (){
                                  if(controller.signupKey.value.currentState!.validate()){
                                    var data ={
                                      "first_name": controller.firstNameController.value.text,
                                      "last_name": controller.lastNameController.value.text,
                                      "email": controller.emailController.value.text,
                                      "password": controller.passwordController.value.text,
                                      "country": "UAE",
                                      "phone": controller.phoneController.value.text,
                                      "role": "Student" // Emum: Student/Teacher
                                    };
                                    //Get.toNamed(Routes.OTP, arguments: data);
                                    controller.signUpWithEmail();
                                  }else{
                                    return;
                                  }
                                }
                            );
                          }
                        )
                    ),
                    SizedBox(height: 30,),


                  ],
                ),
              )
            ],
          ),

        ),
      )
    );
  }
}
