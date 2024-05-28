// To parse this JSON data, do
//
//     final login = loginFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';


class Costumer {
    Costumer({
        required this.id,
        required this.username,
        required this.password,
        required this.profileImage,
        required this.coverImage,
        required this.title,
    });

    int id;
    String username;
    String password;
    String profileImage;
    dynamic coverImage;
    String title;

    factory Costumer.fromJson(String str) => Costumer.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Costumer.fromMap(Map<String, dynamic> json) => Costumer(
        id: json["id"],
        username: json["username"],
        password: json["password"],
        profileImage: json["profile_image"],
        coverImage: json["cover_image"],
        title: json["title"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "username": username,
        "password": password,
        "profile_image": profileImage,
        "cover_image": coverImage,
        "title": title,
    };
}
