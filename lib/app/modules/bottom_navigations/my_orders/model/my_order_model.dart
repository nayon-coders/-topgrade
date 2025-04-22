// To parse this JSON data, do
//
//     final myOrderModel = myOrderModelFromJson(jsonString);

import 'dart:convert';

MyOrderModel myOrderModelFromJson(String str) => MyOrderModel.fromJson(json.decode(str));

String myOrderModelToJson(MyOrderModel data) => json.encode(data.toJson());

class MyOrderModel {
  final bool? success;
  final String? message;
  final List<SingleOrderModel>? data;

  MyOrderModel({
    this.success,
    this.message,
    this.data,
  });

  factory MyOrderModel.fromJson(Map<String, dynamic> json) => MyOrderModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<SingleOrderModel>.from(json["data"]!.map((x) => SingleOrderModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SingleOrderModel {
  final int? orderId;
  final String? orderStatus;
  final DateTime? orderCreateAt;
  final DateTime? orderUpdatedAt;
  final String? type;
  final int? packagesId;
  final String? packagesTitle;
  final double? price;
  final String? packagesDuration;
  final String? introUrl;
  final int? courseDetailId;
  final String? totalDuration;
  final String? totalChapter;
  final int? teacherId;
  final String? teacherFirstName;
  final String? teacherLastName;
  final String? teacherEmail;
  final String? teacherPhone;
  final String? teacherCountry;
  final String? teacherProfilePic;
  final double? teacherAverageRating;
  final int? teacherTotalRating;
  final int? courseId;
  final String? courseTitle;
  final String? courseImage;
  final int? topicId;
  final String? topicName;
  final List<MyCoursesVideo>? videos;

  SingleOrderModel({
    this.orderId,
    this.orderStatus,
    this.orderCreateAt,
    this.orderUpdatedAt,
    this.type,
    this.packagesId,
    this.packagesTitle,
    this.price,
    this.packagesDuration,
    this.introUrl,
    this.courseDetailId,
    this.totalDuration,
    this.totalChapter,
    this.teacherId,
    this.teacherFirstName,
    this.teacherLastName,
    this.teacherEmail,
    this.teacherPhone,
    this.teacherCountry,
    this.teacherProfilePic,
    this.teacherAverageRating,
    this.teacherTotalRating,
    this.courseId,
    this.courseTitle,
    this.courseImage,
    this.topicId,
    this.topicName,
    this.videos,
  });

  factory SingleOrderModel.fromJson(Map<String, dynamic> json) => SingleOrderModel(
    orderId: json["order_id"],
    orderStatus: json["order_status"],
    orderCreateAt: json["order_create_at"] == null ? null : DateTime.parse(json["order_create_at"]),
    orderUpdatedAt: json["order_updated_at"] == null ? null : DateTime.parse(json["order_updated_at"]),
    type: json["type"],
    packagesId: json["packages_id"],
    packagesTitle: json["packages_title"],
    price: json["price"]?.toDouble(),
    packagesDuration: json["packages_duration"],
    introUrl: json["intro_url"],
    courseDetailId: json["course_detail_id"],
    totalDuration: json["total_duration"],
    totalChapter: json["total_chapter"],
    teacherId: json["teacher_id"],
    teacherFirstName: json["teacher_first_name"],
    teacherLastName: json["teacher_last_name"],
    teacherEmail: json["teacher_email"],
    teacherPhone: json["teacher_phone"],
    teacherCountry: json["teacher_country"],
    teacherProfilePic: json["teacher_profile_pic"],
    teacherAverageRating: json["teacher_average_rating"]?.toDouble(),
    teacherTotalRating: json["teacher_total_rating"],
    courseId: json["course_id"],
    courseTitle: json["course_title"],
    courseImage: json["course_image"],
    topicId: json["topic_id"],
    topicName: json["topic_name"],
    videos: json["videos"] == null ? [] : List<MyCoursesVideo>.from(json["videos"]!.map((x) => MyCoursesVideo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "order_status": orderStatus,
    "order_create_at": orderCreateAt?.toIso8601String(),
    "order_updated_at": orderUpdatedAt?.toIso8601String(),
    "type": type,
    "packages_id": packagesId,
    "packages_title": packagesTitle,
    "price": price,
    "packages_duration": packagesDuration,
    "intro_url": introUrl,
    "course_detail_id": courseDetailId,
    "total_duration": totalDuration,
    "total_chapter": totalChapter,
    "teacher_id": teacherId,
    "teacher_first_name": teacherFirstName,
    "teacher_last_name": teacherLastName,
    "teacher_email": teacherEmail,
    "teacher_phone": teacherPhone,
    "teacher_country": teacherCountry,
    "teacher_profile_pic": teacherProfilePic,
    "teacher_average_rating": teacherAverageRating,
    "teacher_total_rating": teacherTotalRating,
    "course_id": courseId,
    "course_title": courseTitle,
    "course_image": courseImage,
    "topic_id": topicId,
    "topic_name": topicName,
    "videos": videos == null ? [] : List<dynamic>.from(videos!.map((x) => x.toJson())),
  };
}

class MyCoursesVideo {
  final int? id;
  final String? url;
  final int? srNo;
  final String? title;
  final String? duration;
  final int? isPaid;

  MyCoursesVideo({
    this.id,
    this.url,
    this.srNo,
    this.title,
    this.duration,
    this.isPaid,
  });

  factory MyCoursesVideo.fromJson(Map<String, dynamic> json) => MyCoursesVideo(
    id: json["id"],
    url: json["url"],
    srNo: json["sr_no"],
    title: json["title"],
    duration: json["duration"],
    isPaid: json["isPaid"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "sr_no": srNo,
    "title": title,
    "duration": duration,
    "isPaid": isPaid,
  };
}
