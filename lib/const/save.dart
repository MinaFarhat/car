import 'dart:convert';

import 'package:car/const/shp.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:car/Models/costumer.dart';

class Savedata {
  String username;
  String password;
  Savedata({
    required this.username,
    required this.password,
  });
}
