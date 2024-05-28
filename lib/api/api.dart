import 'dart:convert';
import 'dart:io';

import 'package:car/Models/costumer.dart';
import 'package:car/Models/filtter_result.dart';
import 'package:car/const/save.dart';
import 'package:car/const/shp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  static String url = "https://www.carrentalclub.ae";

  static Future<List<FilterResult>> getFilterResult(String year, String brand,
      String model, String color, String price, String sort) async {
    var headers = {
      'Content-Type': 'application/json',
    };
    var request = http.Request(
        'POST', Uri.parse('https://www.carrentalclub.ae/api/car_filter'));
    request.body = json.encode({
      "year": year,
      "brand": brand,
      "model": model,
      "color": color,
      "price": price,
      "sort": sort
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String data = await response.stream.bytesToString();
      var list = jsonDecode(data) as List;
      List<FilterResult> filterData = <FilterResult>[];
      for (var f in list) {
        filterData.add(FilterResult.fromMap(f));
      }
      return filterData;
    } else {
      return [];
      
    }
  }

  static Future login(String name, String password) async {
    var headers = {
      'Content-Type': 'application/json',
    };
    var request = http.Request(
        'POST', Uri.parse('https://www.carrentalclub.ae/api/login_company'));
    request.body = json.encode({"username": name, "pass": password});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 200) {
      // Shp.saveloginfo();
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }
static Future sendperson(String name,String phone,String lan,File image)async{
var request = http.MultipartRequest('POST', Uri.parse('https://www.carrentalclub.ae/api/contact_person'));
request.fields.addAll({
  'name': name,
  'phone':phone,
  'languages': lan,
});
request.files.add(await http.MultipartFile.fromPath('file', image.path));

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
 return true;
}
else {
 return false;
}

} 
}
