// To parse this JSON data, do
//
//     final filterResult = filterResultFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<FilterResult> filterResultFromMap(String str) => List<FilterResult>.from(json.decode(str).map((x) => FilterResult.fromMap(x)));

String filterResultToMap(List<FilterResult> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class FilterResult {
    FilterResult({
        required this.id,
        required this.title,
        required this.search,
        required this.image,
        required this.avilable,
        required this.companyId,
        required this.brandId,
        required this.pricPerDay,
        required this.doors,
        required this.passengers,
        required this.location,
        required this.color,
        required this.modelId,
        required this.year,
        required this.pricePerMonth,
        required this.brand,
        required this.model,
        required this.company,
        required this.companyImage,
        required this.images,
    });

    int id;
    String title;
    String search;
    String image;
    int avilable;
    int companyId;
    int brandId;
    int pricPerDay;
    int doors;
    int passengers;
    String location;
    String color;
    int modelId;
    int year;
    dynamic pricePerMonth;
    String brand;
    String model;
    String company;
    String companyImage;
    List<dynamic> images;

    factory FilterResult.fromMap(Map<String, dynamic> json) => FilterResult(
        id: json["id"],
        title: json["title"],
        search: json["search"],
        image: json["image"],
        avilable: json["avilable"],
        companyId: json["company_id"],
        brandId: json["brand_id"],
        pricPerDay: json["pric_per_day"],
        doors: json["doors"],
        passengers: json["passengers"],
        location: json["location"],
        color: json["color"],
        modelId: json["model_id"],
        year: json["year"],
        pricePerMonth: json["price_per_month"],
        brand: json["brand"],
        model: json["model"],
        company: json["company"],
        companyImage: json["company_image"],
        images: List<dynamic>.from(json["images"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "search": search,
        "image": image,
        "avilable": avilable,
        "company_id": companyId,
        "brand_id": brandId,
        "pric_per_day": pricPerDay,
        "doors": doors,
        "passengers": passengers,
        "location": location,
        "color": color,
        "model_id": modelId,
        "year": year,
        "price_per_month": pricePerMonth,
        "brand": brand,
        "model": model,
        "company": company,
        "company_image": companyImage,
        "images": List<dynamic>.from(images.map((x) => x)),
    };
}
