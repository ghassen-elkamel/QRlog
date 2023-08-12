// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Customer loginFromJson(String str) => Customer.fromJson(json.decode(str));

String loginToJson(Customer data) => json.encode(data.toJson());

class Customer {
  Customer({
    this.username,
    this.password,
    required this.firstName,
    required this.lastName,
    this.role,
    this.id,
    this.status,
    this.email,
    this.matriculation,
    this.remote,
  });

  String? status;
  String? id;
  String? role;
  String? username;
  String? password;
  String firstName;
  String lastName;
  String? email;
  String? matriculation;
  String? remote;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        username: json["username"],
        password: json["password"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        role: json["role"],
        id: json["_id"],
        status: json["status"],
        email: json["email"],
        matriculation: json["matriculation"],
        remote: json["remote"],
      );

  Map<String, dynamic> toJson() => {
        if (username != null) "username": username,
        if (password != null) "password": password,
        "firstName": firstName,
        "lastName": lastName,
        if (email != null) "email": email,
        if (matriculation != null) "matriculation": matriculation,
        if (role != null) "role": role,
        if (status != null) "status": status,
        if (remote != null) "remote": remote,
      };
}
