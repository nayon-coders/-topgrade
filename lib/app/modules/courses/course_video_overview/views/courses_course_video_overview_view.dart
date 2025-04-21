import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/cart/controllers/cart_controller.dart';
import 'package:kuwait_elearing/app/modules/courses/course_content/model/single_course_details_model.dart';
import 'package:kuwait_elearing/app/widgets/app_style.dart';
import 'package:kuwait_elearing/app/widgets/app_top_bar.dart';
import 'package:kuwait_elearing/app/widgets/default_page_layout.dart';
import 'package:kuwait_elearing/utility/app_color.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../course_content/controllers/courses_course_content_controller.dart';
import '../controllers/courses_course_video_overview_controller.dart';

class CoursesCourseVideoOverviewView
    extends GetView<CoursesCourseVideoOverviewController> {
  CoursesCourseVideoOverviewView({super.key});

  Semester packageData = Get.arguments["package"] ?? Get.arguments["semester"];
  Teacher teacherInfo = Get.arguments["teacher"];

  @override
  Widget build(BuildContext context) {
    controller.initializePlayer(packageData.introUrl ?? "https://cdn.pixabay.com/video/2017/04/05/8579-211655655_large.mp4");
    return Scaffold(
      body: DefaultPageLayout(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 385,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  AppTopBar(
                    isBack: true,
                    onBack: () => Get.back(),
                  ),
                  // Video Section with Updated Styling
                  Container(
                    height: 220, // Increased height for a better aspect ratio
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Colors.black,

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Obx(() {
                      if (!controller.isInitialized.value) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      final position = controller.videoPlayer.value.position;
                      final duration = controller.videoPlayer.value.duration;

                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Center(
                            child: AspectRatio(
                              aspectRatio: controller.videoPlayer.value.aspectRatio,
                              child: VideoPlayer(controller.videoPlayer),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            right: 0,
                            child: IconButton(
                              onPressed: (){
                                print("go to full screen");
                              },
                              icon: Icon(Icons.fullscreen, color: AppColor.white,),
                            ),
                          ),
                          _buildControls(context),
                          Positioned(
                            bottom: 20,
                            left: 20,
                            right: 20,
                            child: VideoProgressIndicator(
                              controller.videoPlayer,
                              allowScrubbing: true,
                              colors: VideoProgressColors(
                                playedColor: Colors.red,
                                bufferedColor: Colors.grey,
                                backgroundColor: Colors.white24,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 35,
                            left: 20,
                            right: 20,
                            child: Obx(() => RichText(text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: "${controller.currentTime.value} ",
                                      style: normalText(fontSize: 10)
                                  ),
                                  TextSpan(
                                      text: "/ ${controller.totalTime.value} ",
                                      style: normalText(fontSize: 10, fontColor: Colors.grey)
                                  )
                                ]
                            ))),

                          ),




                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView(
                  padding: EdgeInsets.zero,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${packageData.title}",
                      style: normalText(
                          fontSize: 18, fontColor: AppColor.primaryColor),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "${teacherInfo.firstName} ${teacherInfo.lastName}",
                      style: normalText(fontSize: 16, fontColor: AppColor.primaryColor),
                    ),
                    SizedBox(height: 8),
                    Divider(height: 1, color: Colors.black),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.video_camera_back_outlined,
                          color: Colors.black,
                          size: 20,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "${packageData.videos!.length} Lesson",
                          style: normalText(fontSize: 16, fontColor: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.watch_later_outlined,
                          color: Colors.black,
                          size: 20,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "${packageData.duration}",
                          style: normalText(fontSize: 16, fontColor: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Videos",
                      style: normalText(fontSize: 16, fontColor: AppColor.black),
                    ),
                    SizedBox(height: 15),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: packageData.videos!.length,
                      itemBuilder: (_, index) {
                        var data = packageData.videos![index];
                        return InkWell(
                          onTap: (){
                            controller.initializePlayer(data.url!);
                          },
                          child: Container(
                            height: 90, // Increased height for better readability
                            padding: EdgeInsets.all(15),
                            margin: EdgeInsets.only(bottom: 15),
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 90,
                                  height: 90,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Obx(() {
                                          return Image.memory(controller.thumbnailList.value[index]!, fit: BoxFit.cover);
                                        }
                                      ),
                                      Icon(Icons.play_circle_fill, size: 48, color: Colors.white),
                                    ],
                                  )


                                ),
                                SizedBox(width: 15),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${packageData.title}",
                                      style: normalText(fontSize: 16),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "${controller.formatDuration(controller.videoPlayer.value.duration)}",
                                      style: normalText(fontSize: 16),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        width: Get.width,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(30)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${double.parse(packageData.price.toString()).toStringAsFixed(2)} KD",
              style: normalText(fontSize: 15),
            ),
            InkWell(
              onTap: (){
                  CartController.to.addToCart(packageData.id.toString(), CoursesCourseContentController.to.isPackage.value ? "packages" : "semester" );
              },
              child: Container(
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
              ),
            )
          ],
        ),
      ),
    );
  }



  Widget _buildControls(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: controller.togglePlayPause,
        child: AnimatedOpacity(
          opacity: controller.isPlaying.value ? 0.0 : 1.0,
          duration: const Duration(milliseconds: 300),
          child: Container(
            color: Colors.black26,
            child: const Center(
              child: Icon(Icons.play_circle_fill, size: 90, color: Colors.white),
            ),
          ),
        ),
      );
    });
  }
}
