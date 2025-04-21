import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/bottom_navigations/bottom_menus/views/bottom_menus_view.dart';
import 'package:kuwait_elearing/app/routes/app_pages.dart';
import 'package:kuwait_elearing/app/widgets/app_network_images.dart';
import 'package:kuwait_elearing/app/widgets/app_style.dart';
import 'package:kuwait_elearing/app/widgets/app_top_bar.dart';
import 'package:kuwait_elearing/app/widgets/default_page_layout.dart';
import 'package:kuwait_elearing/app/widgets/nodata_found.dart';
import 'package:kuwait_elearing/utility/app_color.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});
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
                height: Get.height-400,
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
                          return controller.isLoading.value
                              ? Center(child: CircularProgressIndicator.adaptive(backgroundColor: Colors.white,),)
                              : controller.myCardModel.value.data == null || controller.myCardModel.value.data!.isEmpty
                              ? SizedBox(
                                height: 300,
                                child: NoDataFound(),
                              ) :ListView.builder(
                                itemCount: controller.myCardModel.value.data!.length,
                                padding: EdgeInsets.zero,
                                itemBuilder: (_, index){
                                  var data = controller.myCardModel.value.data![index];
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
                                    trailing:  InkWell(
                                      onTap: (){
                                        controller.deleteCard(data.cardId.toString());
                                      },
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: Icon(Icons.delete, color: Colors.white,),
                                      ),
                                    )

                                  );
                                },
                              );
                        }
                      ),
                    ),
                    SizedBox(height: 10,),
                    Center(
                      child: InkWell(
                        onTap: ()=>Get.toNamed(Routes.CHECKOUT),
                        child: Container(
                          width: 140,
                          height: 40,
                          decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(100)
                          ),
                          child: Center(
                            child: Text("Next",
                              style: normalText(
                                  fontColor: AppColor.primaryColor
                              ),
                            ),
                          ),

                        ),
                      ),
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

