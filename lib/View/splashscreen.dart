import 'dart:async';

import 'package:car/View/login.dart';
import 'package:car/View/mynavbar.dart';
import 'package:car/const/global.dart';
import 'package:car/const/shp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Shp.loadloginfo().then((value) {
      if (Global.savedata == null ||
          (Global.savedata!.username == "non" &&
              Global.savedata!.password == "non")) {
        Timer(
            Duration(seconds: 3),
            () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Login())));
      } else {
        Timer(
            Duration(seconds: 3),
            () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Mynavbar())));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome Back!",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: "OpenSans",
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/car2.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
