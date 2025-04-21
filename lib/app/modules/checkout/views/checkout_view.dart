import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/cart/controllers/cart_controller.dart';
import 'package:kuwait_elearing/app/widgets/app_input.dart';

import '../../../../utility/app_color.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/app_network_images.dart';
import '../../../widgets/app_style.dart';
import '../../../widgets/app_top_bar.dart';
import '../../../widgets/default_page_layout.dart';
import '../../../widgets/nodata_found.dart';
import '../../bottom_navigations/bottom_menus/views/bottom_menus_view.dart';
import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({super.key});
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
                child: Text("Cart",
                  style: normalText(
                      fontSize: 32,
                      fontColor: AppColor.primaryColor
                  ),
                ),
              ),
              SizedBox(height: 10,),

              Container(
                width: Get.width,
                height: Get.height-410,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Obx(() {
                        return CartController.to.isLoading.value
                            ? Center(child: CircularProgressIndicator.adaptive(backgroundColor: Colors.white,),)
                            : CartController.to.myCardModel.value.data == null || CartController.to.myCardModel.value.data!.isEmpty
                            ? SizedBox(
                          height: 300,
                          child: NoDataFound(),
                        ) :ListView.builder(
                          itemCount: CartController.to.myCardModel.value.data!.length,
                          padding: EdgeInsets.zero,
                          itemBuilder: (_, index){
                            var data = CartController.to.myCardModel.value.data![index];
                            return  ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: AppNetworkImage(
                                    url: data.courseImage!,
                                    height: 60,
                                    weight: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(data.courseTitle!,
                                  style: normalText(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${data.teacherFirstName}, ${data.teacherLastName}, ",
                                      style: normalText(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text("${double.parse("${data.price}").toStringAsFixed(2)} KD",
                                      style: normalText(
                                          fontSize: 15
                                      ),
                                    ),
                                  ],
                                ),

                            );
                          },
                        );
                      }
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("%",
                                style: normalText(),
                              ),
                              SizedBox(width: 5,),
                              SizedBox(
                                width: Get.width*.50,
                                height: 30,
                                child: TextFormField(
                                  controller: controller.couponCode.value,
                                  decoration: InputDecoration(
                                    hintText: "Coupon Code",
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
                              ),
                              Spacer(),
                              InkWell(
                                onTap: (){
                                  controller.applyCoupon();
                                },
                                child: Container(
                                  width: 70,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: AppColor.white,
                                    borderRadius: BorderRadius.circular(100)
                                  ),
                                  child: Center(
                                    child: Obx((){
                                        return controller.isCoupon.value ? CircularProgressIndicator.adaptive(backgroundColor: AppColor.primaryColor,) : Text("Add",
                                          style: normalText(fontColor: Colors.black),
                                        );
                                      }
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10,),
                          Obx((){
                              return Visibility(
                                visible: controller.couponModel.value.data != null,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Obx(() {
                                        return Text("Coupon: ${controller.couponModel.value.data!.title}",
                                          style: normalText(
                                            fontSize: 15
                                          ),
                                        );
                                      }
                                    ),
                                    Obx(() {
                                        return Text("-${controller.totalDiscountAmount.value.toStringAsFixed(2)} KD",
                                          style: normalText(
                                              fontSize: 15
                                          ),
                                        );
                                      }
                                    )
                                  ],
                                ),
                              );
                            }
                          ),
                          SizedBox(height: 7,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total",
                                style: normalText(
                                    fontSize: 15
                                ),
                              ),
                              Obx(() {
                                  return Text("${controller.totalPaymentAmount.value.toStringAsFixed(2)} KD KD",
                                    style: normalText(
                                        fontSize: 15
                                    ),
                                  );
                                }
                              )
                            ],
                          )
                        ],
                      ),
                    )

                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: InkWell(
                  onTap: ()=>Get.toNamed(Routes.PAYMENT),
                  child: Container(
                    width: 140,
                    height: 40,
                    decoration: BoxDecoration(
                        color: AppColor.secounderyColor,
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: Center(
                      child: Text("Pay",
                        style: normalText(
                            fontColor: AppColor.white
                        ),
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
