import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/cart/controllers/cart_controller.dart';
import 'package:kuwait_elearing/app/modules/checkout/controllers/checkout_controller.dart';
import 'package:flutter/material.dart';

import '../../../../utility/app_color.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/app_style.dart';
import '../../../widgets/app_top_bar.dart';
import '../../../widgets/default_page_layout.dart';
import '../../bottom_navigations/bottom_menus/views/bottom_menus_view.dart';

class Payment extends GetView<CheckoutController> {
  const Payment({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultPageLayout(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTopBar(
                isBack: true,
                isShowCart: false,
                onBack: ()=>Get.back(),
              ),
              Center(
                child: Text("Payment",
                  style: normalText(
                      fontSize: 32,
                      fontColor: AppColor.primaryColor
                  ),
                ),
              ),
              SizedBox(height: 10,),

              Container(
                width: Get.width,
                height: Get.height-500,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Text("Payable Amount",
                      style: normalText(fontSize: 18, fontColor: AppColor.white),
                    ),),
                    Center(child: Obx((){
                        return Text("${controller.totalPaymentAmount.value.toStringAsFixed(2)} KD",
                          style: normalText(fontSize: 30, fontColor: AppColor.white),
                        );
                      }
                    ),),
                    Spacer(),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: controller.whatsAppNumber.value,
                            decoration: InputDecoration(
                              hintText: "WhatsApp Number",
                              contentPadding: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
                              filled: true,
                              fillColor: AppColor.inputFieldColor,
                              border: OutlineInputBorder(
                                  borderRadius:   BorderRadius.circular(100),
                                  borderSide: BorderSide.none
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:  BorderRadius.circular(100),
                                  borderSide: BorderSide.none
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  borderSide: BorderSide.none
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text("Provide your whatsapp number. Admin will be contract with you.",
                            style: normalText(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                fontColor: Colors.red
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,)

                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: InkWell(
                    onTap: (){
                      if(controller.whatsAppNumber.value.text.isEmpty){
                        Get.snackbar("Error!", "Please type your whatsapp number!", backgroundColor: Colors.red, colorText: AppColor.white);
                      }else{
                        controller.placeOrder();
                      }
                    },
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                        color: AppColor.secounderyColor,
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: Center(
                      child: Obx(() {
                          return controller.isPlacingOrder.value
                              ? CircularProgressIndicator.adaptive(backgroundColor: AppColor.primaryColor,)
                              :  Text("Complied payment",
                            style: normalText(
                                fontColor: AppColor.white
                            ),
                          );
                        }
                      ),
                    ),

                  ),
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
