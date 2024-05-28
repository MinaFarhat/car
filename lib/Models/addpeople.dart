// To parse this JSON data, do
//
//     final login = loginFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Login> loginFromMap(String str) =>
    List<Login>.from(json.decode(str).map((x) => Login.fromMap(x)));

String loginToMap(List<Login> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Login {
  Login({
    required this.id,
    required this.name,
    required this.phone,
    required this.image,
    required this.languages,
    required this.companyId,
    required this.avilable,
  });

  int id;
  String name;
  String phone;
  String image;
  String languages;
  int companyId;
  int avilable;

  factory Login.fromMap(Map<String, dynamic> json) => Login(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        image: json["image"],
        languages: json["languages"],
        companyId: json["company_id"],
        avilable: json["avilable"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "phone": phone,
        "image": image,
        "languages": languages,
        "company_id": companyId,
        "avilable": avilable,
      };
}
