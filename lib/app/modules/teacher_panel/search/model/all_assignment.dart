// To parse this JSON data, do
//
//     final allAssignmentListModel = allAssignmentListModelFromJson(jsonString);

import 'dart:convert';

AllAssignmentListModel allAssignmentListModelFromJson(String str) => AllAssignmentListModel.fromJson(json.decode(str));

String allAssignmentListModelToJson(AllAssignmentListModel data) => json.encode(data.toJson());

class AllAssignmentListModel {
  final bool? success;
  final String? message;
  final int? totalCoursesDetails;
  final List<SingleAssignmentModel>? data;

  AllAssignmentListModel({
    this.success,
    this.message,
    this.totalCoursesDetails,
    this.data,
  });

  factory AllAssignmentListModel.fromJson(Map<String, dynamic> json) => AllAssignmentListModel(
    success: json["success"],
    message: json["message"],
    totalCoursesDetails: json["totalCoursesDetails"],
    data: json["data"] == null ? [] : List<SingleAssignmentModel>.from(json["data"]!.map((x) => SingleAssignmentModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "totalCoursesDetails": totalCoursesDetails,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SingleAssignmentModel {
  final int? id;
  final int? coursesId;
  final int? studentId;
  final String? coursesType;
  final String? date;
  final String? file;
  final String? description;
  final DateTime? bidTime;
  final String? status;
  final Student? student;
  final Courses? courses;

  SingleAssignmentModel({
    this.id,
    this.coursesId,
    this.studentId,
    this.coursesType,
    this.date,
    this.file,
    this.description,
    this.bidTime,
    this.status,
    this.student,
    this.courses,
  });

  factory SingleAssignmentModel.fromJson(Map<String, dynamic> json) => SingleAssignmentModel(
    id: json["id"],
    coursesId: json["courses_id"],
    studentId: json["student_id"],
    coursesType: json["courses_type"],
    date: json["date"],
    file: json["file"],
    description: json["description"],
    bidTime: json["bid_time"] == null ? null : DateTime.parse(json["bid_time"]),
    status: json["status"],
    student: json["student"] == null ? null : Student.fromJson(json["student"]),
    courses: json["courses"] == null ? null : Courses.fromJson(json["courses"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "courses_id": coursesId,
    "student_id": studentId,
    "courses_type": coursesType,
    "date": date,
    "file": file,
    "description": description,
    "bid_time": bidTime?.toIso8601String(),
    "status": status,
    "student": student?.toJson(),
    "courses": courses?.toJson(),
  };
}

class Courses {
  final int? id;
  final String? title;
  final String? image;
  final String? status;

  Courses({
    this.id,
    this.title,
    this.image,
    this.status,
  });

  factory Courses.fromJson(Map<String, dynamic> json) => Courses(
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

class Student {
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
  final double? averageRating;
  final int? totalRating;
  final String? status;

  Student({
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
    this.averageRating,
    this.totalRating,
    this.status,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
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
    averageRating: json["average_rating"]?.toDouble(),
    totalRating: json["total_rating"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
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
    "average_rating": averageRating,
    "total_rating": totalRating,
    "status": status,
  };
}
