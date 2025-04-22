import 'dart:async';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../../bottom_navigations/my_orders/model/my_order_model.dart';
import '../../course_content/model/single_course_details_model.dart';

class CoursesCourseVideoOverviewController extends GetxController {
  static CoursesCourseVideoOverviewController get to => Get.find();
  late VideoPlayerController videoPlayer;
  var isInitialized = false.obs;
  var isPlaying = false.obs;
  Rx<Vedio> selectedMyCourseVideos = Vedio().obs;

  Semester packageData = Get.arguments["package"] ?? Get.arguments["semester"];

  var currentTime = "00:00".obs;
  var totalTime = "00:00".obs;

  var currentPosition = Rx<Duration>(Duration.zero);


  Timer? _timer; // 🔥 Make it nullable to avoid late errors


  @override
  void onInit() {
    super.onInit();
    generateAllThumbnails();
  }

  // Selected video
  void selectedVideos(Vedio video)async {
    await videoPlayer?.dispose();
    _timer?.cancel();
    isInitialized.value = false;
    isPlaying.value = false;
    currentTime.value = "00:00";
    totalTime.value = "00:00";
    selectedMyCourseVideos.value = video;
    initializePlayer(video.url ?? "https://cdn.pixabay.com/video/2017/04/05/8579-211655655_large.mp4");
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

      videoPlayer!.addListener(() {
        isPlaying.value = videoPlayer!.value.isPlaying;
        currentPosition.value = videoPlayer!.value.position;
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

  RxBool isThumbnailList = false.obs;
  Future<void> generateAllThumbnails() async {
    thumbnailList.clear();

    isThumbnailList.value = true;
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
    isThumbnailList.value = false;
  }
  @override
  void onClose() {
    videoPlayer.dispose();
    _timer?.cancel();
    super.onClose();
  }
}
