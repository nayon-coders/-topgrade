import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuwait_elearing/app/routes/app_pages.dart';
import 'package:kuwait_elearing/app/widgets/app_network_images.dart';
import 'package:kuwait_elearing/app/widgets/nodata_found.dart';
import 'package:kuwait_elearing/utility/app_assets.dart';
import 'package:kuwait_elearing/utility/app_json.dart';

import '../../../../../utility/app_color.dart';
import '../../../../widgets/app_top_bar.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      padding: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        gradient: AppColor.primaryGradient,
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// this is app topbar widgets
            /// here we use [BottomNavigationsCartView] [On Back is optional]
            AppTopBar(),
            InkWell(
              onTap: ()=> _selectLevel(context),
              child: Container(
                width: 150,
                height: 35,
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(100)
                ),
                child: Center(
                  child: Text("SELECT LEVEL",
                    style: GoogleFonts.finlandica(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColor.white
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20,),
           Center(
             child: Text("Courses",
               style: GoogleFonts.finlandica(
                   fontSize: 24,
                   fontWeight: FontWeight.w700,
                   color: AppColor.primaryColor
               ),
             ),
           ),
           // Expanded(
           //   child: ListView.builder(
           //     itemCount: courses.length,
           //     // shrinkWrap: true,
           //     // physics: NeverScrollableScrollPhysics(),
           //     itemBuilder: (context, index){
           //       var data = courses[index];
           //       return ;
           //     },
           //   ),
           // )

            //university course
            Obx((){
                return Visibility(
                  visible: controller.isUniversity.value,
                  child: controller.iAllUniversityCourse.value
                      ? Center(child: CircularProgressIndicator.adaptive(backgroundColor: AppColor.white,),)
                       : controller.allUniversityCourseModel.value.data == null
                      ? SizedBox(height: 400, child: NoDataFound(),)
                      : Column(
                       children: controller.allUniversityCourseModel.value.data!.map((data){
                      return InkWell(
                       onTap: (){
                         controller.selectedCourseID.value = data.id.toString(); //assign the value for the course id.
                         Get.toNamed(Routes.COURSES_SINGLE_COURSE, arguments: data);
                       },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${data.title}",
                                style: GoogleFonts.finlandica(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                              SizedBox(height: 8,),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: AppNetworkImage(
                                  height: 170,
                                  url: data.image!,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );
              }
            ),
            // Obx((){
            //   return Visibility(
            //     visible: controller.isUniversity.value == false,
            //     child: controller.iAllUniversityCourse.value ? Center(child: CircularProgressIndicator.adaptive(backgroundColor: AppColor.white,),) : Column(
            //       children: controller.allUniversityCourseModel.value.data!.map((data){
            //         return InkWell(
            //           onTap: (){
            //             if( controller.isUniversity.value == true){
            //               Get.toNamed(Routes.COURSES_SINGLE_COURSE);
            //               return;
            //             }else{
            //               Get.toNamed(Routes.STUDENT_SINGLE_COURSE);
            //               return;
            //             }
            //           },
            //           child: Container(
            //             margin: EdgeInsets.only(bottom: 10),
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.start,
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text("${data.title}",
            //                   style: GoogleFonts.finlandica(
            //                       fontSize: 16,
            //                       fontWeight: FontWeight.w700
            //                   ),
            //                 ),
            //                 SizedBox(height: 8,),
            //                 ClipRRect(
            //                   borderRadius: BorderRadius.circular(100),
            //                   child: AppNetworkImage(
            //                     height: 170,
            //                     url: data.image!,
            //                   ),
            //                 )
            //               ],
            //             ),
            //           ),
            //         );
            //       }).toList(),
            //     ),
            //   );
            // }
            // )


          ],
        ),
      ),
    );
  }




  // select level
  Future<void> _selectLevel(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColor.primaryColor,
          content:  SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Center(
                  child: Text("SELECT LEVEL",
                    style: GoogleFonts.finlandica(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: AppColor.white
                    ),
                  ),
                ),

                SizedBox(height: 30,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //university
                    Column(
                      children: [
                        InkWell(
                          onTap: ()=>controller.selectLevel(true),
                          child: Obx(() {
                              return Container(
                                width: 100,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: controller.isUniversity.value ?  Color(0xffA3850D) : AppColor.white,
                                  borderRadius: BorderRadius.circular(100)
                                ),
                                child: Center(
                                  child: Text("University",
                                    style: GoogleFonts.finlandica(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                      color: controller.isUniversity.value?  AppColor.white : AppColor.black,
                                    ),
                                  ),
                                ),
                              );
                            }
                          ),
                        ),
                        SizedBox(height: 10,),
                        Image.asset(AppAssets.univercity_icon,
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        )

                      ],
                    ),

                    //school
                    Column(
                      children: [
                        InkWell(
                          onTap: ()=>controller.selectLevel(false),
                          child: Obx(() {
                              return Container(
                                width: 100,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: controller.isUniversity.value == false?  Color(0xffA3850D) : AppColor.white,
                                    borderRadius: BorderRadius.circular(100)
                                ),
                                child: Center(
                                  child: Text("School",
                                    style: GoogleFonts.finlandica(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                       color: controller.isUniversity.value == false?  AppColor.white : AppColor.black,
                                    ),
                                  ),
                                ),
                              );
                            }
                          ),
                        ),
                        SizedBox(height: 10,),
                        Image.asset(AppAssets.school_icon,
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        )

                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}




