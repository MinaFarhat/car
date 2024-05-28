import 'dart:async';
import 'dart:io';
import 'package:car/View/settingscreen.dart';
import 'package:car/api/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:im_stepper/main.dart';
import 'package:im_stepper/stepper.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../const/global.dart';
import 'mynavbar.dart';
import 'package:image_picker/image_picker.dart';

class Stt extends StatefulWidget {
  const Stt({Key? key}) : super(key: key);

  @override
  State<Stt> createState() => _SttState();
}

class _SttState extends State<Stt> {
  File? _imagefile;
  final ImagePicker _picker = ImagePicker();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  GlobalKey<FormState> formkey1 = GlobalKey<FormState>();
  GlobalKey<FormState> formkey2 = GlobalKey<FormState>();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController whanumber = TextEditingController();
  bool validatfname = false;
  bool validatlname = false;
  int lindex = 0;
  List<int> select = [];
  List l = ["ARABIC", "ENGLISH", "FRENCH", "CHINESE", "ITALIAN", "RUSSIAN"];
   String m='' ;
  String? sss() {
    if(select.isNotEmpty){
        for (var element in select) {
    m =m+l[select[element]]+"/";
    print(m);
    }
   }
    return m;
  }
  Widget lan(String language, int index) {
    return InkWell(
      onTap: () {
        if (!select.contains(index)) {
          setState(() {
            select.add(index);
          });
        } else {
          setState(() {
            select.remove(index);
          });
        }
      },
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  language.toString(),
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: "OpenSans",
                    fontFamilyFallback: ["Regular"],
                    fontWeight: FontWeight.w600,
                  ),
                ),
                select.contains(index)
                    ? Icon(
                        Icons.done,
                        size: 18,
                        color: Global.primary,
                      )
                    : Container(),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              color: Colors.grey.shade700,
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  bool? photo;
  int _curentstep = 0;
  int c = 0;
  bool c1 = true;
  bool c2 = false;
  bool c3 = false;
  bool c4 = false;
  bool c5 = false;
  bool b = false;
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
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
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
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
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
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
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: c1 == true
                                      ? Global.primary
                                      : Colors.black),
                              child: Center(
                                child: Icon(
                                  Icons.co_present_outlined,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                width: 38,
                                height: 1.5,
                                color:
                                    c1 == true ? Global.primary : Colors.black,
                              ),
                            ),
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: c2 == true
                                      ? Global.primary
                                      : Colors.black),
                              child: Center(
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                  width: 38,
                                  height: 1.5,
                                  color: c2 == true
                                      ? Global.primary
                                      : Colors.black),
                            ),
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: c3 == true
                                      ? Global.primary
                                      : Colors.black),
                              child: Center(
                                child: Icon(
                                  Icons.local_phone_sharp,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                  width: 38,
                                  height: 1.5,
                                  color: c3 == true
                                      ? Global.primary
                                      : Colors.black),
                            ),
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: c4 == true
                                      ? Global.primary
                                      : Colors.black),
                              // child: Center(
                              //   child: Icon(
                              //     Icons.whatsapp_outlined,
                              //     color: Colors.white,
                              //     size: 26,
                              //   ),
                              // ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                width: 38,
                                height: 1.5,
                                color:
                                    c4 == true ? Global.primary : Colors.black,
                              ),
                            ),
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: c5 == true
                                      ? Global.primary
                                      : Colors.black),
                              child: Center(
                                child: Icon(
                                  Icons.language,
                                  color: Colors.white,
                                  size: 26,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      _curentstep == 0
                          ? Form(
                              key: formkey,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return ErrorHint(
                                                    "First Name is required")
                                                .toString();
                                          }
                                          return null;
                                        },
                                        controller: firstname,
                                        enableSuggestions: true,
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 14),
                                        cursorHeight: 25,
                                        cursorColor: Colors.black,
                                        decoration: const InputDecoration(
                                          focusColor: Colors.white,
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                          ),
                                          hoverColor: Colors.white,
                                          hintText: "First Name",
                                          hintStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        keyboardType: TextInputType.name,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.035,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return ErrorHint(
                                                    "Last Name is required")
                                                .toString();
                                          }
                                          return null;
                                        },
                                        controller: lastname,
                                        enableSuggestions: true,
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 14),
                                        cursorHeight: 25,
                                        cursorColor: Colors.black,
                                        decoration: const InputDecoration(
                                          focusColor: Colors.white,
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                          ),
                                          hoverColor: Colors.white,
                                          hintText: "Last Name",
                                          hintStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        keyboardType: TextInputType.name,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.035,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(),
                      _curentstep == 1
                          ? Container(
                              child: Center(
                                child: Stack(
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.12,
                                        ),
                                        Text(
                                          "Add Photos",
                                          style: TextStyle(
                                              fontSize: 23,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: "OpenSans",
                                              fontFamilyFallback: ["Regular"],
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        imageprofile(),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(),
                      _curentstep == 2
                          ? Form(
                              key: formkey1,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return ErrorHint(
                                                  "Mobile Number is required")
                                              .toString();
                                        }
                                        return null;
                                      },
                                      controller: phonenumber,
                                      enableSuggestions: true,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 14),
                                      cursorHeight: 25,
                                      cursorColor: Colors.black,
                                      decoration: const InputDecoration(
                                        focusColor: Colors.white,
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1.0),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1.0),
                                        ),
                                        hoverColor: Colors.white,
                                        hintText: "Mobile Number",
                                        hintStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      _curentstep == 3
                          ? Form(
                              key: formkey2,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return ErrorHint(
                                                  "Whatsapp Number is required")
                                              .toString();
                                        }
                                        return null;
                                      },
                                      controller: whanumber,
                                      enableSuggestions: true,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 14),
                                      cursorHeight: 25,
                                      cursorColor: Colors.black,
                                      decoration: const InputDecoration(
                                        focusColor: Colors.white,
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1.0),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1.0),
                                        ),
                                        hoverColor: Colors.white,
                                        hintText: "Whatsapp Number",
                                        hintStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      _curentstep == 4
                          ? SingleChildScrollView(
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.9,
                                        child: ListView.builder(
                                          itemCount: l.length,
                                          itemBuilder: (context, index) {
                                            return lan(l[index], index);
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              right: MediaQuery.of(context).size.width * 0.17,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _curentstep >= 4
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                if (select.isNotEmpty) {
                                  b = true;

                                  Api.sendperson(
                                      (firstname.text +' '+ lastname.text),
                                      phonenumber.text,
                                      sss().toString(),
                                     _imagefile!,
                                  );
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
                                          message:
                                              "Choose at least one language"));
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
                                if (formkey.currentState!.validate()) {
                                  if (c2 == false) {
                                    setState(() {
                                      c2 = true;
                                      _curentstep += 1;
                                    });
                                  } else {
                                    print("MM11");
                                  }
                                }
                              } else if (_curentstep == 1) {
                                if (_imagefile != null) {
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
                                          message: "Choose Profile Photo"));
                                }
                              } else if (_curentstep == 2) {
                                try {
                                  if (formkey1.currentState!.validate()) {
                                    if (c4 == false) {
                                      setState(() {
                                        c4 = true;
                                        _curentstep += 1;
                                      });
                                    } else {
                                      print("MM36");
                                    }
                                  }
                                } catch (e) {}
                              } else if (_curentstep == 3) {
                                try {
                                  if (formkey2.currentState!.validate()) {
                                    if (c5 == false) {
                                      setState(() {
                                        c5 = true;
                                        _curentstep += 1;
                                      });
                                    }
                                  }
                                } catch (e) {}
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
                            "Saving Your adding Information",
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
                            right: MediaQuery.of(context).size.width * 0.31,
                            bottom: MediaQuery.of(context).size.height * 0.52,
                            child: Center(
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28),
                                    color: Global.primary),
                                child: Center(
                                  child: Icon(
                                    Icons.co_present_outlined,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ),
                            )),
                        Positioned(
                            right: MediaQuery.of(context).size.width * 0.7,
                            bottom: MediaQuery.of(context).size.height * 0.37,
                            child: Center(
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28),
                                    color: Global.primary),
                                child: Center(
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ),
                            )),
                        Positioned(
                            right: MediaQuery.of(context).size.width * 0.7,
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
                                    Icons.local_phone_sharp,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ),
                            )),
                        Positioned(
                            right: MediaQuery.of(context).size.width * 0.2,
                            bottom: MediaQuery.of(context).size.height * 0.6,
                            child: Center(
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28),
                                    color: Global.primary),
                                // child: Center(
                                //   child: Icon(
                                //     Icons.whatsapp_outlined,
                                //     color: Colors.white,
                                //     size: 25,
                                //   ),
                                // ),
                              ),
                            )),
                        Positioned(
                            right: MediaQuery.of(context).size.width * 0.55,
                            bottom: MediaQuery.of(context).size.height * 0.61,
                            child: Center(
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28),
                                    color: Global.primary),
                                child: Center(
                                  child: Icon(
                                    Icons.language,
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
    final XFile? pickedfile = (await _picker.pickImage(
      source: source,
    )) ;
    setState(() {
      _imagefile =File(pickedfile!.path) ;
    });
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

  Widget imageprofile() {
    return Center(
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (builder) {
                    return bottomsheet();
                  });
            },
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            child: CircleAvatar(
              radius: 65,
              backgroundImage: _imagefile == null
                  ? AssetImage("assets/user.png")
                  : FileImage(File(_imagefile!.path)) as ImageProvider,
            ),
          ),
          Positioned(
            bottom: 15,
            right: 5,
            child: Container(
              width: 20,
              height: 20,
              child: Icon(
                Icons.add,
                color: Colors.black,
                size: 45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
