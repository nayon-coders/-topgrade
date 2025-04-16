import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kuwait_elearing/app/widgets/app_input.dart';

import '../../../../utility/app_color.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/app_network_images.dart';
import '../../../widgets/app_style.dart';
import '../../../widgets/app_top_bar.dart';
import '../../../widgets/default_page_layout.dart';
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
                      child: ListView.builder(
                        itemCount: 3,
                        padding: EdgeInsets.zero,
                        itemBuilder: (_, index){
                          return  ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: AppNetworkImage(
                                url: "https://s3-alpha-sig.figma.com/img/0911/fac2/c7449f95cc7e0e4bd4153a5c3c00d739?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=tryQEdi0Dm2n4i5pfuSLcmd91Ok7ThrhNy8kCEqv4or~ppWXvrlL7eKhKbFrm-bHDcV6TiH8wnN6Z4H1e9NzMiyoeZaDCH2sG9ssrMknoatWwfwjLvVheOlyX7URGhPueVDL1EK-if9m98G4l-vhPd2NCYW1qrxapQ2mloCgOQGUvhh5p~pkIbxxyagdFxGdk04Vy-ukauFeqFQbfZ6k6jjtApzxdtlq9LHdDVKcTbsTAGp0Jwq86w~8lJ-L4SLu9m69qpvdYr~7zlmBc9AbSpSP3OppHyQiE1FX4I5eO~1eqdb-Fq1YF8rxxgD0wy-3BzCNyRdp4CPNs51-M569qw__",
                                height: 60,
                                weight: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text("Mathematics: Calculus 1",
                              style: normalText(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("By: Eng. Ahmad",
                                  style: normalText(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("10.000 KD",
                                  style: normalText(
                                      fontSize: 15
                                  ),
                                ),
                              ],
                            ),

                          );
                        },
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
                              Container(
                                width: 70,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(100)
                                ),
                                child: Center(
                                  child: Text("Add",
                                    style: normalText(fontColor: Colors.black),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Coupon: (20% OFF) Added",
                                style: normalText(
                                  fontSize: 15
                                ),
                              ),
                              Text("-2.000 KD",
                                style: normalText(
                                    fontSize: 15
                                ),
                              )
                            ],
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
                              Text("8.000 KD KD",
                                style: normalText(
                                    fontSize: 15
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
              SizedBox(
                height: 10,
              ),
              Center(
                child: InkWell(
                  onTap: ()=>Get.toNamed(Routes.CHECKOUT),
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
