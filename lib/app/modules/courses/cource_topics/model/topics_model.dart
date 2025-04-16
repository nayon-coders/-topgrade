// To parse this JSON data, do
//
//     final allUniversityCourseTopicsModel = allUniversityCourseTopicsModelFromJson(jsonString);

import 'dart:convert';

AllUniversityCourseTopicsModel allUniversityCourseTopicsModelFromJson(String str) => AllUniversityCourseTopicsModel.fromJson(json.decode(str));

String allUniversityCourseTopicsModelToJson(AllUniversityCourseTopicsModel data) => json.encode(data.toJson());

class AllUniversityCourseTopicsModel {
  final bool? success;
  final String? message;
  final Data? data;

  AllUniversityCourseTopicsModel({
    this.success,
    this.message,
    this.data,
  });

  factory AllUniversityCourseTopicsModel.fromJson(Map<String, dynamic> json) => AllUniversityCourseTopicsModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  final int? id;
  final String? title;
  final String? image;
  final String? status;
  final List<CourseTopic>? courseTopic;

  Data({
    this.id,
    this.title,
    this.image,
    this.status,
    this.courseTopic,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    status: json["status"],
    courseTopic: json["courseTopic"] == null ? [] : List<CourseTopic>.from(json["courseTopic"]!.map((x) => CourseTopic.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "status": status,
    "courseTopic": courseTopic == null ? [] : List<dynamic>.from(courseTopic!.map((x) => x.toJson())),
  };
}

class CourseTopic {
  final int? id;
  final int? coursesId;
  final String? name;

  CourseTopic({
    this.id,
    this.coursesId,
    this.name,
  });

  factory CourseTopic.fromJson(Map<String, dynamic> json) => CourseTopic(
    id: json["id"],
    coursesId: json["courses_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "courses_id": coursesId,
    "name": name,
  };
}
