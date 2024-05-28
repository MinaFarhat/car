import 'package:car/View/homescreen.dart';
import 'package:car/View/notification.dart';
import 'package:car/View/settingscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../const/global.dart';

class Mynavbar extends StatefulWidget {
  const Mynavbar( {Key? key}) : super(key: key);

  @override
  State<Mynavbar> createState() => _MynavbarState();
}

class _MynavbarState extends State<Mynavbar> {
  List screens = [Homescreen(), Notificationscreen(), Settingscreen()];
  int curentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[curentindex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 27,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                size: 27,
              ),
              label: "Notifications"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 27,
              ),
              label: "Settings"),
        ],
        onTap: (index) {
          setState(() {
            curentindex = index;
          });
        },
        selectedItemColor: Global.primary,
        currentIndex: curentindex,
        
      ),
    );
  }
}
