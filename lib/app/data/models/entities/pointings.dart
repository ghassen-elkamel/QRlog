// To parse this JSON data, do
//
//     final pointings = pointingsFromJson(jsonString);

import 'dart:convert';

import 'package:qrlog_frontend/app/data/models/entities/customer.dart';

Pointings pointingsFromJson(String str) => Pointings.fromJson(json.decode(str));

String pointingsToJson(Pointings data) => json.encode(data.toJson());

class Pointings {
  Pointings({
    required this.id,
    required this.action,
    required this.date,
    this.user,
    this.userId,
    this.validity,
    this.convertdate,
  });

  String id;
  String action;
  DateTime date;
  Customer? user;
  String? userId;

  bool? validity;
  String? convertdate;

  factory Pointings.fromJson(Map<String, dynamic> json) => Pointings(
      id: json["_id"],
      action: json["action"],
      date: DateTime.parse(json["date"]),
      user: json["user"] is String ? null : Customer.fromJson(json["user"]),
      userId: json["user"] is String ? json["user"] : null,
      validity: json["validity"],
      convertdate: json["convertDate"]);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "action": action,
        "date": date.toIso8601String(),
        "user": user?.toJson(),
        "validity": validity,
      };
}
