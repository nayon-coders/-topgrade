import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/course_order_details/views/full_screen.dart';
import 'package:video_player/video_player.dart';

import '../../../../utility/app_color.dart';
import '../../../widgets/app_style.dart';
import '../../../widgets/app_top_bar.dart';
import '../../../widgets/default_page_layout.dart';
import '../../bottom_navigations/my_orders/model/my_order_model.dart';
import '../controllers/course_order_details_controller.dart';

class MyCourseVideo extends GetView<CourseOrderDetailsController> {
   MyCourseVideo({super.key});


   final SingleOrderModel data = Get.arguments;
  @override
  Widget build(BuildContext context) {

    controller.initializePlayer(data.introUrl ?? "");

    return  Scaffold(
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

                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Center(
                            child: AspectRatio(
                              aspectRatio: controller.videoPlayer!.value.aspectRatio,
                              child: VideoPlayer(controller.videoPlayer!),
                            ),
                          ),


                          _buildControls(context),
                          Positioned(
                            bottom: 20,
                            left: 20,
                            right: 20,
                            child: VideoProgressIndicator(
                              controller.videoPlayer!,
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
                          Positioned(
                            bottom: 20,
                            right: 0,
                            child: IconButton(
                              onPressed: (){
                                Get.to(FullScreenVideo(videoPlayer: controller.videoPlayer!, currentTime: controller.currentTime, totalTime: controller.totalTime));
                              },
                              icon: Icon(Icons.fullscreen, color: AppColor.white,),
                            ),
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
                    Obx(() {
                        return Text(
                          "${controller.selectedMyCourseVideos.value.title == null ? data.courseTitle : controller.selectedMyCourseVideos.value.title}",
                          style: normalText(
                              fontSize: 18, fontColor: AppColor.primaryColor),
                        );
                      }
                    ),
                    SizedBox(height: 5),
                    Text(
                      "${data.teacherFirstName} ${data.teacherLastName}",
                      style: normalText(fontSize: 16, fontColor: AppColor.primaryColor),
                    ),
                    SizedBox(height: 8),
                    Divider(height: 1, color: Colors.black),
                    SizedBox(height: 8),
                    // Row(
                    //   children: [
                    //     Icon(
                    //       Icons.video_camera_back_outlined,
                    //       color: Colors.black,
                    //       size: 20,
                    //     ),
                    //     SizedBox(width: 5),
                    //     Text(
                    //       "${data.videos!.length} Lesson",
                    //       style: normalText(fontSize: 16, fontColor: Colors.black),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.watch_later_outlined,
                          color: Colors.black,
                          size: 20,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "${data.totalDuration}",
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
                      itemCount: data.videos!.length,
                      itemBuilder: (_, index) {
                        var videos = data.videos![index];
                        return InkWell(
                          onTap: (){
                           controller.selectedVideos(videos);
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
                                          return controller.isThumblnilGenareting.value ? CircularProgressIndicator.adaptive(backgroundColor: AppColor.white,)  :Image.memory(controller.thumbnailList.value[index]!, fit: BoxFit.cover);
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
                                      "${videos.title}",
                                      style: normalText(fontSize: 16),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "${videos.duration}",
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



