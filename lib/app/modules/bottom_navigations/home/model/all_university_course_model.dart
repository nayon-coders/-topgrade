// To parse this JSON data, do
//
//     final allUniversityCourseModel = allUniversityCourseModelFromJson(jsonString);

import 'dart:convert';

AllUniversityCourseModel allUniversityCourseModelFromJson(String str) => AllUniversityCourseModel.fromJson(json.decode(str));

String allUniversityCourseModelToJson(AllUniversityCourseModel data) => json.encode(data.toJson());

class AllUniversityCourseModel {
  final bool? success;
  final String? message;
  final int? totalCourses;
  final List<Datum>? data;

  AllUniversityCourseModel({
    this.success,
    this.message,
    this.totalCourses,
    this.data,
  });

  factory AllUniversityCourseModel.fromJson(Map<String, dynamic> json) => AllUniversityCourseModel(
    success: json["success"],
    message: json["message"],
    totalCourses: json["totalCourses"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "totalCourses": totalCourses,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  final int? id;
  final String? title;
  final String? image;
  final String? status;

  Datum({
    this.id,
    this.title,
    this.image,
    this.status,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "status": status,
  };
}
