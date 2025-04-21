// To parse this JSON data, do
//
//     final courseTeachersListModel = courseTeachersListModelFromJson(jsonString);

import 'dart:convert';

CourseTeachersListModel courseTeachersListModelFromJson(String str) => CourseTeachersListModel.fromJson(json.decode(str));

String courseTeachersListModelToJson(CourseTeachersListModel data) => json.encode(data.toJson());

class CourseTeachersListModel {
  final bool? success;
  final String? message;
  final Data? data;

  CourseTeachersListModel({
    this.success,
    this.message,
    this.data,
  });

  factory CourseTeachersListModel.fromJson(Map<String, dynamic> json) => CourseTeachersListModel(
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
  final int? coursesId;
  final String? name;
  final List<Teacher>? teachers;

  Data({
    this.id,
    this.coursesId,
    this.name,
    this.teachers,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    coursesId: json["courses_id"],
    name: json["name"],
    teachers: json["teachers"] == null ? [] : List<Teacher>.from(json["teachers"]!.map((x) => Teacher.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "courses_id": coursesId,
    "name": name,
    "teachers": teachers == null ? [] : List<dynamic>.from(teachers!.map((x) => x.toJson())),
  };
}

class Teacher {
  final int? teacherId;
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? uid;
  final String? signUpMethod;
  final String? email;
  final String? password;
  final String? country;
  final String? phone;
  final String? profilePic;
  final String? role;
  final String? status;

  Teacher({
    this.teacherId,
    this.id,
    this.firstName,
    this.lastName,
    this.uid,
    this.signUpMethod,
    this.email,
    this.password,
    this.country,
    this.phone,
    this.profilePic,
    this.role,
    this.status,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
    teacherId: json["teacher_id"],
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    uid: json["uid"],
    signUpMethod: json["sign_up_method"],
    email: json["email"],
    password: json["password"],
    country: json["country"],
    phone: json["phone"],
    profilePic: json["profile_pic"],
    role: json["role"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "teacher_id": teacherId,
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "uid": uid,
    "sign_up_method": signUpMethod,
    "email": email,
    "password": password,
    "country": country,
    "phone": phone,
    "profile_pic": profilePic,
    "role": role,
    "status": status,
  };
}
