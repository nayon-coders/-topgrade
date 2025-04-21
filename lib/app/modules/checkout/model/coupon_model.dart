// To parse this JSON data, do
//
//     final couponModel = couponModelFromJson(jsonString);

import 'dart:convert';

CouponModel couponModelFromJson(String str) => CouponModel.fromJson(json.decode(str));

String couponModelToJson(CouponModel data) => json.encode(data.toJson());

class CouponModel {
  final bool? success;
  final String? message;
  final Data? data;

  CouponModel({
    this.success,
    this.message,
    this.data,
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) => CouponModel(
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
  final String? code;
  final int? discount;
  final DateTime? expirationDate;
  final int? isActive;

  Data({
    this.id,
    this.title,
    this.code,
    this.discount,
    this.expirationDate,
    this.isActive,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    title: json["title"],
    code: json["code"],
    discount: json["discount"],
    expirationDate: json["expiration_date"] == null ? null : DateTime.parse(json["expiration_date"]),
    isActive: json["is_active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "code": code,
    "discount": discount,
    "expiration_date": expirationDate?.toIso8601String(),
    "is_active": isActive,
  };
}
