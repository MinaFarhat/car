import 'package:car/View/homescreen.dart';
import 'package:car/View/of.dart';
import 'package:car/View/splashscreen.dart';
import 'package:car/View/stt.dart';
import 'package:car/View/cars.dart';
import 'package:car/View/cartype.dart';
import 'package:car/View/mynavbar.dart';
import 'package:car/View/addcar.dart';
import 'package:car/const/shp.dart';
import 'package:flutter/material.dart';
import 'View/login.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  Map<int, Color> color =
  {
  50:Color.fromRGBO(253,96,1, .1),
  100:Color.fromRGBO(253,96,1, .2),
  200:Color.fromRGBO(253,96,1, .3),
  300:Color.fromRGBO(253,96,1, .4),
  400:Color.fromRGBO(253,96,1, .5),
  500:Color.fromRGBO(253,96,1, .6),
  600:Color.fromRGBO(253,96,1, .7),
  700:Color.fromRGBO(253,96,1, .8),
  800:Color.fromRGBO(253,96,1, .9),
  900:Color.fromRGBO(253,96,1, 1),
  };

  

  @override
  Widget build(BuildContext context) {
    MaterialColor colorCustom = MaterialColor(0xFF880E4F, color);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: colorCustom,
      ),
      home:Splashscreen(),
    );
  }
}
