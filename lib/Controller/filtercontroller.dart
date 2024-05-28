import 'package:car/api/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Models/filtter_result.dart';

class Filtercontroller extends GetxController {


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    try {
      loading = true;
      update(); 
      Api.getFilterResult('%', '%', '%', '%', '9999999999', 'ASE')
          .then((value) {
          res.addAll(value);
          loading = false;
      update(); 

      });
    } catch (e) {
      print(ErrorHint("There is no intrnet"));
    }
  }


  List<FilterResult> res = [];
  bool loading = false;
  int choose = 0;
  int v = 0;
  double currentRangeValues = 100;
  bool down_up = false;
  bool down_up1 = false;
  bool down_up2 = false;
  bool down_up3 = false;
  int? year;
  int? brand;
  int? carmodel;
  int? color;
  getyear(int ind) {
    year = ind;
    update();
  }

  getbrand(int ind) {
    brand = ind;
    update();
  }

  getcarmodel(int ind) {
    carmodel = ind;
    update();
  }

  getcolor(int ind) {
    color = ind;
    update();
  }

  getrange(double rg) {
    currentRangeValues = rg;
    update();
  }

  getdown_up(bool du) {
    down_up = du;
    update();
  }

  getdown_up1(bool du) {
    down_up1 = du;
    update();
  }

  getdown_up2(bool du) {
    down_up2 = du;
    update();
  }

  getdown_up3(bool du) {
    down_up3 = du;
    update();
  }

  getv(int vv) {
    v = vv;
    update();
  }

  getchoose(int ch) {
    choose = ch;
    update();
  }

  getfilter(String? year, String? brand, String? carmodel, String? color,
      String? price, String? sort) async {
    loading = true;
    res = await Api.getFilterResult(year.toString(), brand.toString(),
        carmodel.toString(), color.toString(), price.toString(), sort!);
    loading = false;
    update();
  }

  deletbutton(String? year, String? brand, String? carmodel, String? color,
      String? price, String? sort) async {
    loading = true;
    res =
        await Api.getFilterResult("%", "%", "%", "%", "9999999999999", "DESC");
    loading = false;
    update();
  }

  price(String? year, String? brand, String? carmodel, String? color,
      String? price, String? sort) async {
    loading = true;
    res = await Api.getFilterResult(
        year!, brand!, carmodel!, color!, price!, sort!);
    loading = false;
    update();
  }
  
}
