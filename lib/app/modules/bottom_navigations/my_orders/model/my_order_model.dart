// To parse this JSON data, do
//
//     final myOrderModel = myOrderModelFromJson(jsonString);

import 'dart:convert';

List<MyOrderModel> myOrderModelFromJson(String str) => List<MyOrderModel>.from(json.decode(str).map((x) => MyOrderModel.fromJson(x)));

String myOrderModelToJson(List<MyOrderModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyOrderModel {
  final String? type;
  final String? assignment;
  final String? order;
  final String? date;
  final String? status;
  final String? engineering;
  final String? image;

  MyOrderModel({
    this.type,
    this.assignment,
    this.order,
    this.date,
    this.status,
    this.engineering,
    this.image,
  });

  factory MyOrderModel.fromJson(Map<String, dynamic> json) => MyOrderModel(
    type: json["type"]!,
    assignment: json["assignment"],
    order: json["order"],
    date: json["date"].toString(),
    status: json["status"]!,
    engineering: json["engineering"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "assignment": assignment,
    "order": order,
    "date": "${date}",
    "status": status,
    "engineering": engineering,
    "image": image,
  };
}

