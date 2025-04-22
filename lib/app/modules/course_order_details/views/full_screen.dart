import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuwait_elearing/app/modules/courses/course_content/controllers/courses_course_content_controller.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';

import '../../../widgets/app_style.dart';
import '../controllers/course_order_details_controller.dart';

class FullScreenVideo extends StatefulWidget {
  final VideoPlayerController videoPlayer;
  final dynamic currentTime;
  final dynamic totalTime;

  const FullScreenVideo({Key? key, required this.videoPlayer, this.currentTime, this.totalTime}) : super(key: key);

  @override
  State<FullScreenVideo> createState() => _FullScreenVideoState();
}

class _FullScreenVideoState extends State<FullScreenVideo> {
  double _volume = 1.0;
  bool _isControlsVisible = true;

  final CourseOrderDetailsController _courseContentController = Get.find();

  @override
  void initState() {
    super.initState();

    // Set landscape
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    // Hide status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }


  @override
  Widget build(BuildContext context) {
    final videoPlayer = widget.videoPlayer;

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          setState(() {
            _isControlsVisible = !_isControlsVisible;
          });

        },
        child: Stack(
          children: [
            Center(
              child: AspectRatio(
                aspectRatio: videoPlayer.value.aspectRatio,
                child: VideoPlayer(videoPlayer),
              ),
            ),
            if (_isControlsVisible)
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.black45,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            videoPlayer.value.isPlaying ? Icons.pause : Icons.play_arrow,
                            color: Colors.white,
                          ),
                          onPressed: () {
                          setState(() {
                              videoPlayer.value.isPlaying
                                  ? videoPlayer.pause()
                                  : videoPlayer.play();
                            });

                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.fullscreen_exit, color: Colors.white),
                          onPressed: () async{
                            await SystemChrome.setPreferredOrientations([
                              DeviceOrientation.portraitUp,
                            ]);
                            await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
                            Get.back();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            if (_isControlsVisible)
              Positioned(
                top: 20,
                right: 20,
                child: IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () async{
                    await SystemChrome.setPreferredOrientations([
                      DeviceOrientation.portraitUp,
                    ]);
                    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
                    Get.back();
                  }
                ),
              ),
            if(_isControlsVisible)
              Positioned(
                bottom: 10,
                left: 20,
                right: 20,
                child: VideoProgressIndicator(
                  widget.videoPlayer!,
                  allowScrubbing: true,
                  colors: VideoProgressColors(
                    playedColor: Colors.red,
                    bufferedColor: Colors.grey,
                    backgroundColor: Colors.white24,
                  ),
                ),
              ),
              Positioned(
              bottom: 50,
              left: 20,
              right: 20,
              child: Obx(() {
                String currentTime = _courseContentController.formatDuration(_courseContentController.currentPosition.value);
                return RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "${currentTime} ",
                          style: normalText(fontSize: 10)
                      ),
                      TextSpan(
                          text: "/ ${_courseContentController.totalTime.value} ",
                          style: normalText(fontSize: 10, fontColor: Colors.grey)
                      )
                    ],
                  ),
                );
              })


              ),
          ],
        ),
      ),
    );
  }
}
