import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/bottom_navigations/bottom_menus/views/bottom_menus_view.dart';
import 'package:kuwait_elearing/app/widgets/app_network_images.dart';
import 'package:kuwait_elearing/app/widgets/app_style.dart';
import 'package:kuwait_elearing/app/widgets/app_top_bar.dart';
import 'package:kuwait_elearing/app/widgets/default_page_layout.dart';
import 'package:kuwait_elearing/utility/app_color.dart';

import '../controllers/assignment_order_details_controller.dart';

class AssignmentOrderDetailsView
    extends GetView<AssignmentOrderDetailsController> {
  const AssignmentOrderDetailsView({super.key});
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
                 isShowCart: false,
               ),

               Container(
                 width: Get.width,
                 padding: EdgeInsets.all(20),
                 decoration: BoxDecoration(
                   color: AppColor.primaryColor,
                   borderRadius: BorderRadius.circular(50)
                 ),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Row(
                       children: [
                         Expanded(
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text("Assignment: Homework ",
                                style: normalText(fontSize: 15),
                               ),
                               SizedBox(height: 20,),
                               Text("Date: 10/2/2025 ",
                                 style: normalText(fontSize: 15),
                               ),
                               SizedBox(height: 20,),
                               Text("Status: Awaiting Evaluation",
                                 style: normalText(fontSize: 15),
                               ),
                               SizedBox(height: 20,),
                               Text("File attatchment",
                                 style: normalText(fontSize: 15),
                               ),
                               SizedBox(height: 25,),
                               Text("Due date: 15/2/2025 8pm GMT+3",
                                 style: normalText(fontSize: 15),
                               ),

                             ],
                           ),
                         ),
                         SizedBox(width: 10,),
                         Container(
                           width: 100,
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               SizedBox(
                                 width: 60,
                                 height: 60,
                                 child: ClipRRect(
                                   borderRadius: BorderRadius.circular(100),
                                   child: AppNetworkImage(url: "https://cloudfront-us-east-1.images.arcpublishing.com/opb/BRJMOGU4PUEK34KUXB4KS64BRI.jpg", fit: BoxFit.cover,),
                                 ),
                               ),
                               SizedBox(height: 10,),
                               Text("Engineering: Concrete 1",
                                textAlign: TextAlign.center,
                                style: normalText(
                                  fontSize: 15,
                                ),
                               ),
                               SizedBox(height: 10,),
                               Container(
                                 height: 30,
                                 width: 80,
                                 decoration: BoxDecoration(
                                   color: Colors.red,
                                   borderRadius: BorderRadius.circular(100)
                                 ),
                                 child: Center(child: Text("Cancel",
                                  style: normalText(fontSize: 15),
                                 ),),
                               )
                             ],
                           ),
                         )
                       ],
                     ),
                     SizedBox(height: 20,),
                     Text("Description:",
                       style: normalText(fontSize: 15),
                     ),
                     Text("********************************************************************",
                       style: normalText(fontSize: 15),
                     ),


                     //status
                     Padding(
                       padding: const EdgeInsets.only(left: 30.0, right: 30, top: 30),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Container(
                             height: 30,
                             width: 30,
                             decoration: BoxDecoration(
                               color: Color(0xff595656),
                               borderRadius: BorderRadius.circular(100)
                             ),
                           ),
                           Container(
                             width: 70,
                             height: 2,
                             color: Colors.grey,
                           ),
                           Container(
                             height: 30,
                             width: 30,
                             decoration: BoxDecoration(
                                 color: Color(0xffA3850D),
                                 borderRadius: BorderRadius.circular(100)
                             ),
                           ),
                           Container(
                             width: 70,
                             height: 2,
                             color: Colors.grey,
                           ),
                           Container(
                             height: 30,
                             width: 30,
                             decoration: BoxDecoration(
                                 color: Color(0xff4FB448),
                                 borderRadius: BorderRadius.circular(100)
                             ),
                           )
                         ],
                       ),
                     ),
                     Padding(
                       padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           Text("Received",
                             style: normalText(fontSize: 13),
                           ),
                           Text("Received",
                             style: normalText(fontSize: 13),
                           ),
                           Text("Received",
                             style: normalText(fontSize: 13),
                           )
                         ],
                       ),
                     ),

                     SizedBox(height: 10,),
                     Align(
                       alignment: Alignment.centerRight,
                       child: Text("Total: Awaiting Evaluation",
                        style: normalText(fontSize: 13),
                       ),
                     ),
                     SizedBox(height: 20,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Container(
                           width: 150,
                           height: 40,
                           decoration: BoxDecoration(
                             color: Color(0xff76C1DC),
                             borderRadius: BorderRadius.circular(100)
                           ),
                           child: Center(
                             child: Text("Chat with Tutor",
                              style: normalText(fontSize: 15, fontColor: AppColor.primaryColor),
                             ),
                           ),
                         ),
                         Container(
                           width: 120,
                           height: 40,
                           decoration: BoxDecoration(
                               color: Color(0xff4FB448),
                               borderRadius: BorderRadius.circular(100)
                           ),
                           child: Center(
                             child: Text("Pay Now",
                               style: normalText(fontSize: 15, fontColor: AppColor.primaryColor),
                             ),
                           ),
                         )
                       ],
                     )


                   ],
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
