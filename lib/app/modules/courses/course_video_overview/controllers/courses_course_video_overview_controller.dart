import 'dart:async';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../course_content/model/single_course_details_model.dart';

class CoursesCourseVideoOverviewController extends GetxController {
  static CoursesCourseVideoOverviewController get to => Get.find();
  late VideoPlayerController videoPlayer;
  var isInitialized = false.obs;
  var isPlaying = false.obs;
  Semester packageData = Get.arguments["package"] ?? Get.arguments["semester"];

  var currentTime = "00:00".obs;
  var totalTime = "00:00".obs;


  Timer? _timer; // 🔥 Make it nullable to avoid late errors


  @override
  void onInit() {
    super.onInit();
    generateAllThumbnails();
  }

  Future<void> initializePlayer(String url) async {
    print("Video URL init --- $url");

    videoPlayer = VideoPlayerController.networkUrl(Uri.parse(url));

    try {
      await videoPlayer.initialize();
      isInitialized.value = true;
      videoPlayer.play();
      isPlaying.value = true;

      totalTime.value = formatDuration(videoPlayer.value.duration);

      _timer = Timer.periodic(Duration(seconds: 1), (_) {
        currentTime.value = formatDuration(videoPlayer.value.position);
      });

      videoPlayer.addListener(() {
        isPlaying.value = videoPlayer.value.isPlaying;
      });
    } catch (error, stackTrace) {
      print("Video initialization failed: $error");
      print("StackTrace: $stackTrace");
      isInitialized.value = false;
    }
  }

  void togglePlayPause() {
    if (videoPlayer.value.isPlaying) {
      videoPlayer.pause();
    } else {
      videoPlayer.play();
    }
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return "${twoDigits(hours)}:${twoDigits(minutes)}:${twoDigits(seconds)}";
    } else {
      return "${twoDigits(minutes)}:${twoDigits(seconds)}";
    }
  }

  //thumbline
  RxList<Uint8List?> thumbnailList = <Uint8List?>[].obs;

  Future<void> generateAllThumbnails() async {
    thumbnailList.clear();

    for (var url in packageData.videos!) {
      print("url.url! -- ${url.url!}");
      final data = await VideoThumbnail.thumbnailData(
        video: url.url!,
        imageFormat: ImageFormat.JPEG,
        maxWidth: 128,
        quality: 75,
      );
      print("data -- ${data}");
      thumbnailList.add(data); // Add null if failed
      print("thumbnailList -- ${thumbnailList}");
      update();
    }
  }
  @override
  void onClose() {
    videoPlayer.dispose();
    _timer?.cancel();
    super.onClose();
  }
}
