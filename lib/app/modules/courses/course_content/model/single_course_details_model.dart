// To parse this JSON data, do
//
//     final singleCourseDetailsModel = singleCourseDetailsModelFromJson(jsonString);

import 'dart:convert';

SingleCourseDetailsModel singleCourseDetailsModelFromJson(String str) => SingleCourseDetailsModel.fromJson(json.decode(str));

String singleCourseDetailsModelToJson(SingleCourseDetailsModel data) => json.encode(data.toJson());

class SingleCourseDetailsModel {
  final bool? success;
  final String? message;
  final Data? data;

  SingleCourseDetailsModel({
    this.success,
    this.message,
    this.data,
  });

  factory SingleCourseDetailsModel.fromJson(Map<String, dynamic> json) => SingleCourseDetailsModel(
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
  final int? coursesTopicId;
  final int? teacherId;
  final Teacher? teacher;
  final List<Semester>? packages;
  final Semester? semester;

  Data({
    this.id,
    this.coursesId,
    this.coursesTopicId,
    this.teacherId,
    this.teacher,
    this.packages,
    this.semester,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    coursesId: json["courses_id"],
    coursesTopicId: json["courses_topic_id"],
    teacherId: json["teacher_id"],
    teacher: json["teacher"] == null ? null : Teacher.fromJson(json["teacher"]),
    packages: json["packages"] == null ? [] : List<Semester>.from(json["packages"]!.map((x) => Semester.fromJson(x))),
    semester: json["semester"] == null ? null : Semester.fromJson(json["semester"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "courses_id": coursesId,
    "courses_topic_id": coursesTopicId,
    "teacher_id": teacherId,
    "teacher": teacher?.toJson(),
    "packages": packages == null ? [] : List<dynamic>.from(packages!.map((x) => x.toJson())),
    "semester": semester?.toJson(),
  };
}

class Semester {
  final int? id;
  final int? courseDetailsId;
  final String? title;
  final dynamic? price;
  final String? duration;
  final String? introUrl;
  final List<Vedio>? videos;
  final List<Chapter>? chapter;
  final List<Vedio>? vedios;

  Semester({
    this.id,
    this.courseDetailsId,
    this.title,
    this.price,
    this.duration,
    this.introUrl,
    this.videos,
    this.chapter,
    this.vedios,
  });

  factory Semester.fromJson(Map<String, dynamic> json) => Semester(
    id: json["id"],
    courseDetailsId: json["course_details_id"],
    title: json["title"],
    price: json["price"],
    duration: json["duration"],
    introUrl: json["intro_url"],
    videos: json["videos"] == null ? [] : List<Vedio>.from(json["videos"]!.map((x) => Vedio.fromJson(x))),
    chapter: json["chapter"] == null ? [] : List<Chapter>.from(json["chapter"]!.map((x) => Chapter.fromJson(x))),
    vedios: json["vedios"] == null ? [] : List<Vedio>.from(json["vedios"]!.map((x) => Vedio.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "course_details_id": courseDetailsId,
    "title": title,
    "price": price,
    "duration": duration,
    "intro_url": introUrl,
    "videos": videos == null ? [] : List<dynamic>.from(videos!.map((x) => x.toJson())),
    "chapter": chapter == null ? [] : List<dynamic>.from(chapter!.map((x) => x.toJson())),
    "vedios": vedios == null ? [] : List<dynamic>.from(vedios!.map((x) => x.toJson())),
  };
}

class Chapter {
  final int? id;
  final String? chapterName;

  Chapter({
    this.id,
    this.chapterName,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
    id: json["id"],
    chapterName: json["chapter_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "chapter_name": chapterName,
  };
}

class Vedio {
  final int? id;
  final String? url;
  final String? title;
  final String? duration;
  final int? srNo;
  final dynamic? isPaid;

  Vedio({
    this.id,
    this.url,
    this.srNo,
    this.duration,
    this.title,
    this.isPaid,
  });

  factory Vedio.fromJson(Map<String, dynamic> json) => Vedio(
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
    "isPaid": isPaid,
  };
}

class Teacher {
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
  final dynamic? averageRating;
  final int? totalRating;
  final String? status;

  Teacher({
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

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
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
    averageRating: json["average_rating"],
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
