// To parse this JSON data, do
//
//     final myCardModel = myCardModelFromJson(jsonString);

import 'dart:convert';

MyCardModel myCardModelFromJson(String str) => MyCardModel.fromJson(json.decode(str));

String myCardModelToJson(MyCardModel data) => json.encode(data.toJson());

class MyCardModel {
  final bool? success;
  final String? message;
  final List<Datum>? data;

  MyCardModel({
    this.success,
    this.message,
    this.data,
  });

  factory MyCardModel.fromJson(Map<String, dynamic> json) => MyCardModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  final int? cardId;
  final int? userId;
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

  Datum({
    this.cardId,
    this.userId,
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
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    cardId: json["card_id"],
    userId: json["user_id"],
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
  );

  Map<String, dynamic> toJson() => {
    "card_id": cardId,
    "user_id": userId,
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
  };
}
