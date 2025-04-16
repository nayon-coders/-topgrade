import 'package:flutter/material.dart';

// To parse this JSON data, do
//
//     final myInfoModel = myInfoModelFromJson(jsonString);

import 'dart:convert';

MyInfoModel myInfoModelFromJson(String str) => MyInfoModel.fromJson(json.decode(str));

String myInfoModelToJson(MyInfoModel data) => json.encode(data.toJson());

class MyInfoModel {
  final bool? success;
  final String? message;
  final Data? data;

  MyInfoModel({
    this.success,
    this.message,
    this.data,
  });

  factory MyInfoModel.fromJson(Map<String, dynamic> json) => MyInfoModel(
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

  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
