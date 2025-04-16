import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../utility/app_color.dart';
import '../../../../routes/app_pages.dart';
import '../../../../widgets/app_style.dart';
import '../../../../widgets/app_top_bar.dart';
import '../../../../widgets/default_page_layout.dart';
import '../../../bottom_navigations/bottom_menus/views/bottom_menus_view.dart';
import '../controllers/student_study_note_controller.dart';

class StudentStudyNoteView extends GetView<StudentStudyNoteController> {
  const StudentStudyNoteView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultPageLayout(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTopBar(
                isBack: true,
                onBack: ()=>Get.back(),
              ),
              Center(
                child: Text("Study Notes",
                  textAlign: TextAlign.center,
                  style: normalText(
                      fontSize: 32,
                      fontColor: AppColor.primaryColor
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 10,
                  itemBuilder: (_, index){
                    return  InkWell(
                      onTap: ()=>Get.toNamed(Routes.STUDENT_STUDENT_CART),
                      child: Container(
                        height: 100,
                        width: Get.width,
                        padding: EdgeInsets.only(
                            left: 30, right: 30, top: 15, bottom: 15
                        ),
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(100)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Study note name $index ",
                              style: normalText(
                                fontSize: 14,
                              ),
                            ),
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("10.000 KD",
                                  style: normalText(
                                    fontSize: 14,
                                  ),
                                ),

                                Container(
                                  width: 100,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Color(0xffA3850D),
                                      borderRadius: BorderRadius.circular(100)
                                  ),
                                  child: Center(
                                    child: Text("Add to cart",
                                      style: normalText(
                                          fontSize: 14
                                      ),
                                    ),
                                  ),
                                )

                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )

            ],
          ),
        ),
      ),
      bottomNavigationBar: AppBottomMenu(),
    );
  }
}
