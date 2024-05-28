import 'dart:async';
import 'dart:io';

import 'package:car/View/mynavbar.dart';
import 'package:car/View/of.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../const/global.dart';

class Addcar extends StatefulWidget {
  const Addcar({Key? key}) : super(key: key);

  @override
  State<Addcar> createState() => _AddcarState();
}

class _AddcarState extends State<Addcar> {
  TextEditingController _price = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  ScrollController _scrollController=ScrollController();
  final dataKey = new GlobalKey();
  XFile? _imagefile;
  final ImagePicker _picker = ImagePicker();
  List names = ["URUS", "HURACAN", "AVENTADOR"];
  List years = [
    "2018",
    "2019",
    "2020",
    "2021",
    "2022",
    "2023",
    "2024",
    "2025",
    "2026",
    "2027",
    "2028",
    "2029",
    "2030"
  ];
  List colors = [
    "RED",
    "YELLOW & BLACK",
    "YELLOW",
    "BLUE",
    "GREEN",
    "GREEN & BLACK",
    "BLACK",
    "WHITE",
    "INDIGO",
    "PINK",
    "PURPLE",
    "BLUE"
  ];
  List cittes = [
    {"image": "assets/DUBAI.jpg", "name": "DUBAI"},
    {"image": "assets/SHARJAH.jpg", "name": "SHARJAH"},
    {"image": "assets/DAMASCUS.jpg", "name": "DAMASCUS"},
    {"image": "assets/ABU DHABI.jpg", "name": "ABU DHABI"},
    {"image": "assets/BIERUT.jpg", "name": "BIERUT"},
    {"image": "assets/EGYPT.jpg", "name": "EGYPT"},
    {"image": "assets/NEW YORK.jpg", "name": "NEW YORK"},
    {"image": "assets/PARIS.jpg", "name": "PARIS"},
  ];
  List photos = [
    {"image": "assets/BMW.png", "name": "BMW"},
    {"image": "assets/PORSCHE.png", "name": "PORSCHE"},
    {"image": "assets/LAMBORGHINI.png", "name": "LAMBORGHINI"},
    {"image": "assets/ROLLS ROYCE.png", "name": "ROLLS ROYCE"},
    {"image": "assets/CORVETTE.png", "name": "CORVETTE"},
    {"image": "assets/Hummer.png", "name": "ROLLS ROYCE"},
    {"image": "assets/Hummer.png", "name": "ROLLS ROYCE"},
    {"image": "assets/Hummer.png", "name": "ROLLS ROYCE"},
  ];
  List uploadphotos = [];
  int? typeindex;
  int? typeindex1;
  int? yearindex;
  int? colorindex;
  int? cityindex;
  int? upload;
  Widget uploadph(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.height * 0.14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: FileImage(File(uploadphotos[index].toString())),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    uploadphotos.removeAt(index);
                  });
                },
                child: Icon(Icons.delete, color: Colors.black),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          index == uploadphotos.length - 1
              ? Container()
              : Divider(
                  color: Colors.grey.shade800,
                ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget city(int index) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () {
        setState(() {
          cityindex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.25,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0x44eeeeee),
              ),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.width * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                      image: DecorationImage(
                        image: AssetImage(cittes[index]["image"]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    cittes[index]["name"],
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      fontFamily: "OpenSans",
                      fontFamilyFallback: ["Regular"],
                    ),
                  ),
                  Spacer(),
                  cityindex == index
                      ? Icon(
                          Icons.check,
                          color: Global.primary,
                          size: 17,
                        )
                      : Container(),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            index == cittes.length - 1
                ? SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget typeofcars(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          typeindex = index;
        });
      },
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(photos[index]["image"]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Text(
                  photos[index]["name"],
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    fontFamily: "OpenSans",
                    fontFamilyFallback: ["Regular"],
                  ),
                ),
                Spacer(),
                typeindex == index
                    ? Icon(
                        Icons.check,
                        color: Global.primary,
                        size: 17,
                      )
                    : Container(),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            index == photos.length - 1
                ? Container()
                : Divider(
                    color: Colors.grey.shade700,
                  ),
            SizedBox(
              height: 20,
            ),
            index == photos.length - 1
                ? SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  int _curentstep = 0;
  bool c1 = true;
  bool c2 = false;
  bool c3 = false;
  bool c4 = false;
  bool c5 = false;
  bool c6 = false;
  bool c7 = false;
  bool b = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  onTap: () {
                                    if (_curentstep == 0) {
                                      setState(() {
                                        Navigator.of(context).pop();
                                      });
                                    } else if (c1 == true && _curentstep == 1) {
                                      setState(() {
                                        c2 = false;
                                        _curentstep -= 1;
                                      });
                                    } else if (c2 == true && _curentstep == 2) {
                                      setState(() {
                                        c3 = false;
                                        _curentstep -= 1;
                                      });
                                    } else if (c3 == true && _curentstep == 3) {
                                      setState(() {
                                        c4 = false;

                                        _curentstep -= 1;
                                      });
                                    } else if (c4 == true && _curentstep == 4) {
                                      setState(() {
                                        c5 = false;

                                        _curentstep -= 1;
                                      });
                                    } else if (c5 == true && _curentstep == 5) {
                                      setState(() {
                                        c6 = false;

                                        _curentstep -= 1;
                                      });
                                    } else if (c6 == true && _curentstep == 6) {
                                      setState(() {
                                        c7 = false;

                                        _curentstep -= 1;
                                      });
                                    }
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    color: Colors.black,
                                    size: 22,
                                  ),
                                ),
                                Container(
                                  width: 300,
                                  height: 45,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage("assets/logo.png"),
                                    fit: BoxFit.cover,
                                  )),
                                ),
                                InkWell(
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  onTap: () {},
                                  child: Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28),
                                    color: c1 == true
                                        ? Global.primary
                                        : Colors.black,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.sell,
                                      color: Colors.white,
                                      size: 22,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                    width: 15,
                                    height: 1.5,
                                    color: c1 == true
                                        ? Global.primary
                                        : Colors.black,
                                  ),
                                ),
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(28),
                                      color: c2 == true
                                          ? Global.primary
                                          : Colors.black),
                                  child: Center(
                                    child: Icon(
                                      Icons.time_to_leave_rounded,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                      width: 15,
                                      height: 1.5,
                                      color: c2 == true
                                          ? Global.primary
                                          : Colors.black),
                                ),
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(28),
                                      color: c3 == true
                                          ? Global.primary
                                          : Colors.black),
                                  child: Center(
                                    child: Icon(
                                      Icons.shopping_bag_rounded,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                      width: 15,
                                      height: 1.5,
                                      color: c3 == true
                                          ? Global.primary
                                          : Colors.black),
                                ),
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28),
                                    color: c4 == true
                                        ? Global.primary
                                        : Colors.black,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.eco,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                    width: 15,
                                    height: 1.5,
                                    color: c4 == true
                                        ? Global.primary
                                        : Colors.black,
                                  ),
                                ),
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28),
                                    color: c5 == true
                                        ? Global.primary
                                        : Colors.black,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.location_pin,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                    width: 15,
                                    height: 1.5,
                                    color: c5 == true
                                        ? Global.primary
                                        : Colors.black,
                                  ),
                                ),
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28),
                                    color: c6 == true
                                        ? Global.primary
                                        : Colors.black,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.crop_original_rounded,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                    width: 15,
                                    height: 1.5,
                                    color: c6 == true
                                        ? Global.primary
                                        : Colors.black,
                                  ),
                                ),
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28),
                                    color: c7 == true
                                        ? Global.primary
                                        : Colors.black,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.paid,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    _curentstep == 0
                        ? Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: TextFormField(
                                    enableSuggestions: true,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    cursorHeight: 20,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      filled: true,
                                      fillColor: Color(0x44eeeeee),
                                      hintText: "Search",
                                      prefixIcon: Icon(
                                        Icons.search_rounded,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                      hintStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    keyboardType: TextInputType.text,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.035,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.68,
                                child: FadingScroller(
                                  builder: (context, scrollController) =>
                                      ListView.builder(
                                    itemCount: photos.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return typeofcars(index);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container(),
                    _curentstep == 1
                        ? Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: TextFormField(
                                    enableSuggestions: true,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    cursorHeight: 20,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      filled: true,
                                      fillColor: Color(0x44eeeeee),
                                      hintText: "Search",
                                      prefixIcon: Icon(
                                        Icons.search_rounded,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                      hintStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    keyboardType: TextInputType.text,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.035,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.68,
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 3,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          typeindex1 = index;
                                        });
                                      },
                                      overlayColor: MaterialStateProperty.all(
                                          Colors.transparent),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 17),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  names[index],
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: "OpenSans",
                                                    fontFamilyFallback: [
                                                      "Regular"
                                                    ],
                                                  ),
                                                ),
                                                typeindex1 == index
                                                    ? Icon(
                                                        Icons.check,
                                                        color: Global.primary,
                                                        size: 17,
                                                      )
                                                    : Container()
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Divider(
                                              color: Colors.grey.shade700,
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          )
                        : Container(),
                    _curentstep == 2
                        ? Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: TextFormField(
                                    enableSuggestions: true,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    cursorHeight: 20,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      filled: true,
                                      fillColor: Color(0x44eeeeee),
                                      hintText: "Search",
                                      prefixIcon: Icon(
                                        Icons.search_rounded,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                      hintStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    keyboardType: TextInputType.text,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.035,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.68,
                                child: FadingScroller(
                                  builder: (context, scrollController) =>
                                      ListView.builder(
                                    itemCount: years.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          setState(() {
                                            yearindex = index;
                                          });
                                        },
                                        overlayColor: MaterialStateProperty.all(
                                            Colors.transparent),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 17),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    years[index],
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: "OpenSans",
                                                      fontFamilyFallback: [
                                                        "Regular"
                                                      ],
                                                    ),
                                                  ),
                                                  yearindex == index
                                                      ? Icon(
                                                          Icons.check,
                                                          color: Global.primary,
                                                          size: 17,
                                                        )
                                                      : Container()
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              index == years.length - 1
                                                  ? Container()
                                                  : Divider(
                                                      color:
                                                          Colors.grey.shade700,
                                                    ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              index == years.length - 1
                                                  ? SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.1,
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container(),
                    _curentstep == 3
                        ? Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: TextFormField(
                                    enableSuggestions: true,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    cursorHeight: 20,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      filled: true,
                                      fillColor: Color(0x44eeeeee),
                                      hintText: "Search",
                                      prefixIcon: Icon(
                                        Icons.search_rounded,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                      hintStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    keyboardType: TextInputType.text,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.035,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.68,
                                child: FadingScroller(
                                  builder: (context, scrollController) =>
                                      ListView.builder(
                                    itemCount: colors.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          setState(() {
                                            colorindex = index;
                                          });
                                        },
                                        overlayColor: MaterialStateProperty.all(
                                            Colors.transparent),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 17),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    colors[index],
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: "OpenSans",
                                                      fontFamilyFallback: [
                                                        "Regular"
                                                      ],
                                                    ),
                                                  ),
                                                  colorindex == index
                                                      ? Icon(
                                                          Icons.check,
                                                          color: Global.primary,
                                                          size: 17,
                                                        )
                                                      : Container()
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              index == colors.length - 1
                                                  ? Container()
                                                  : Divider(
                                                      color:
                                                          Colors.grey.shade700,
                                                    ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              index == colors.length - 1
                                                  ? SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.1,
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container(),
                    _curentstep == 4
                        ? Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.773,
                                child: FadingScroller(
                                  builder: (context, scrollController) =>
                                      ListView.builder(
                                    itemCount: cittes.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return city(index);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container(),
                    _curentstep == 5
                        ? uploadphotos.isEmpty
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.25,
                                  ),
                                  InkWell(
                                    overlayColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                    onTap: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (builder) {
                                            return bottomsheet();
                                          });
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.22,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xff191919),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.add_circle_outline,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                          SizedBox(
                                            width: 25,
                                          ),
                                          Text(
                                            "Upload More 3 Photos",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "OpenSans",
                                                fontFamilyFallback: ["Regular"],
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                    ),
                                    Container(
                                      height: uploadphotos.length == 1
                                          ? MediaQuery.of(context).size.height *
                                              0.14
                                          : uploadphotos.length == 2
                                              ? MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.34
                                              : MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.535,
                                      child: ListView.builder(
                                        itemCount: uploadphotos.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return uploadph(index);
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: InkWell(
                                        overlayColor: MaterialStateProperty.all(
                                            Colors.transparent),
                                        onTap: () {
                                          //Navigator.of(context).pop();
                                          showModalBottomSheet(
                                              context: context,
                                              builder: (builder) {
                                                return bottomsheet();
                                              });
                                        },
                                        child: Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: Global.primary,
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                        : Container(),
                    _curentstep == 6
                        ? Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Choose The Rent Per Day",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "OpenSans",
                                  fontFamilyFallback: ["Regular"],
                                ),
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color(0x44eeeeee),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.16,
                                      child: TextFormField(
                                        cursorColor: Global.primary,
                                        controller: _price,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                          hintText: "Your Price",
                                          hintStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                    Text(
                                      "AED",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : Container(),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: MediaQuery.of(context).size.width * 0.17,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _curentstep >= 6
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                if (_price.text.isNotEmpty) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  b = true;
                                  Timer(Duration(milliseconds: 800), () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => Mynavbar()));
                                  });
                                } else {
                                  showTopSnackBar(
                                      displayDuration:
                                          Duration(milliseconds: 500),
                                      context,
                                      CustomSnackBar.error(
                                          message: "The Price is required"));
                                }
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color: Global.primary),
                              child: Center(
                                child: Text(
                                  "SAVE",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "OpenSans",
                                      fontFamilyFallback: ["Regular"],
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              if (_curentstep == 0) {
                                if (typeindex != null) {
                                  if (c2 == false) {
                                    setState(() {
                                      c2 = true;
                                      _curentstep += 1;
                                    });
                                  }
                                } else {
                                  showTopSnackBar(
                                      displayDuration:
                                          Duration(milliseconds: 500),
                                      context,
                                      CustomSnackBar.error(
                                          message:
                                              "Choose at least one type of cars!"));
                                }
                              } else if (_curentstep == 1) {
                                if (typeindex1 != null) {
                                  if (c3 == false) {
                                    setState(() {
                                      c3 = true;
                                      _curentstep += 1;
                                    });
                                  }
                                } else {
                                  showTopSnackBar(
                                      displayDuration:
                                          Duration(milliseconds: 500),
                                      context,
                                      CustomSnackBar.error(
                                          message:
                                              "Choose at least one type!"));
                                }
                              } else if (_curentstep == 2) {
                                if (yearindex != null) {
                                  if (c4 == false) {
                                    setState(() {
                                      c4 = true;
                                      _curentstep += 1;
                                    });
                                  }
                                } else {
                                  showTopSnackBar(
                                      displayDuration:
                                          Duration(milliseconds: 500),
                                      context,
                                      CustomSnackBar.error(
                                          message:
                                              "Choose the year of car you want!"));
                                }
                              } else if (_curentstep == 3) {
                                if (colorindex != null) {
                                  if (c5 == false) {
                                    setState(() {
                                      c5 = true;
                                      _curentstep += 1;
                                    });
                                  }
                                } else {
                                  showTopSnackBar(
                                      displayDuration:
                                          Duration(milliseconds: 500),
                                      context,
                                      CustomSnackBar.error(
                                          message:
                                              "Choose the color of car you want!"));
                                }
                              } else if (_curentstep == 4) {
                                if (cityindex != null) {
                                  if (c6 == false) {
                                    setState(() {
                                      c6 = true;
                                      _curentstep += 1;
                                    });
                                  }
                                } else {
                                  showTopSnackBar(
                                      displayDuration:
                                          Duration(milliseconds: 500),
                                      context,
                                      CustomSnackBar.error(
                                          message: "The City is required!"));
                                }
                              } else if (_curentstep == 5) {
                                if (uploadphotos.length >= 3) {
                                  if (c7 == false) {
                                    setState(() {
                                      c7 = true;
                                      _curentstep += 1;
                                    });
                                  }
                                } else {
                                  showTopSnackBar(
                                      displayDuration:
                                          Duration(milliseconds: 500),
                                      context,
                                      CustomSnackBar.error(
                                          message:
                                              "You have to add three photos at least!"));
                                }
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color: Global.primary),
                              child: Center(
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "OpenSans",
                                      fontFamilyFallback: ["Regular"],
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
            b == true
                ? Container(
                    child: Stack(
                      children: [
                        Center(
                          child: Text(
                            "Saving Your Car Information",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: "OpenSans",
                              fontFamilyFallback: ["Regular"],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Positioned(
                            right: MediaQuery.of(context).size.width * 0.6,
                            bottom: MediaQuery.of(context).size.height * 0.4,
                            child: Center(
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28),
                                    color: Global.primary),
                                child: Center(
                                  child: Icon(
                                    Icons.sell,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ),
                            )),
                        Positioned(
                            right: MediaQuery.of(context).size.width * 0.27,
                            bottom: MediaQuery.of(context).size.height * 0.4,
                            child: Center(
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28),
                                    color: Global.primary),
                                child: Center(
                                  child: Icon(
                                    Icons.videocam,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                ),
                              ),
                            )),
                        Positioned(
                            right: MediaQuery.of(context).size.width * 0.7,
                            bottom: MediaQuery.of(context).size.height * 0.54,
                            child: Center(
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28),
                                    color: Global.primary),
                                child: Center(
                                  child: Icon(
                                    Icons.paid,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ),
                            )),
                        Positioned(
                            right: MediaQuery.of(context).size.width * 0.5,
                            bottom: MediaQuery.of(context).size.height * 0.55,
                            child: Center(
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28),
                                    color: Global.primary),
                                child: Center(
                                  child: Icon(
                                    Icons.eco,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ),
                            )),
                        Positioned(
                            right: MediaQuery.of(context).size.width * 0.25,
                            bottom: MediaQuery.of(context).size.height * 0.56,
                            child: Center(
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28),
                                    color: Global.primary),
                                child: Center(
                                  child: Icon(
                                    Icons.shopping_bag_rounded,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                ),
                              ),
                            )),
                        Positioned(
                            right: MediaQuery.of(context).size.width * 0.2,
                            bottom: MediaQuery.of(context).size.height * 0.63,
                            child: Center(
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28),
                                    color: Global.primary),
                                child: Center(
                                  child: Icon(
                                    Icons.location_pin,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ),
                            )),
                        Positioned(
                            right: MediaQuery.of(context).size.width * 0.35,
                            bottom: MediaQuery.of(context).size.height * 0.64,
                            child: Center(
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28),
                                    color: Global.primary),
                                child: Center(
                                  child: Icon(
                                    Icons.crop_original_rounded,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ),
                            )),
                        Positioned(
                            right: MediaQuery.of(context).size.width * 0.55,
                            bottom: MediaQuery.of(context).size.height * 0.66,
                            child: Center(
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28),
                                    color: Global.primary),
                                child: Center(
                                  child: Icon(
                                    Icons.time_to_leave_rounded,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                    color: Colors.black.withOpacity(0.9),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  void takephoto(ImageSource source) async {
    final XFile? pickedfile = await _picker.pickImage(
      source: source,
    );
    try {
      setState(() {
        _imagefile = pickedfile;
        uploadphotos.insert(0, _imagefile!.path);
      });
    } catch (e) {}
  }

  Widget bottomsheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            "Choose a Photot",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: "OpenSans",
                fontFamilyFallback: ["Regular"],
                color: Colors.black),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                onTap: () {
                  takephoto(ImageSource.camera);
                  Navigator.of(context).pop();
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.camera,
                      color: Global.primary,
                      size: 30,
                    ),
                    Text(
                      "Camera",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: "OpenSans",
                        fontFamilyFallback: ["Regular"],
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                onTap: () {
                  takephoto(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.image,
                      color: Global.primary,
                      size: 30,
                    ),
                    Text(
                      "Gallery",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: "OpenSans",
                        fontFamilyFallback: ["Regular"],
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
