import 'package:car/View/addcar.dart';
import 'package:car/View/stt.dart';
import 'package:car/const/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
class Settingscreen extends StatefulWidget {
  const Settingscreen({Key? key}) : super(key: key);

  @override
  State<Settingscreen> createState() => _SettingscreenState();
}

class _SettingscreenState extends State<Settingscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/logo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              InkWell(
                overlayColor:MaterialStateProperty.all(Colors.transparent),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return Addcar();
                  }));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Add A Car",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: "OpenSans",
                          fontFamilyFallback: ["Regular"],
                          color: Colors.black),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                color: Colors.grey.shade800,
                thickness: 1,
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                overlayColor:MaterialStateProperty.all(Colors.transparent),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return Stt();
                  }));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Add People",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: "OpenSans",
                          fontFamilyFallback: ["Regular"],
                          color: Colors.black),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                color: Colors.grey.shade800,
                thickness: 1,
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Change Password",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: "OpenSans",
                          fontFamilyFallback: ["Regular"],
                          color: Colors.black),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                color: Colors.grey.shade800,
                thickness: 1,
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Language",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: "OpenSans",
                          fontFamilyFallback: ["Regular"],
                          color: Colors.black),
                    ),
                    Row(
                      children: [
                        Text(
                          "English",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily: "OpenSans",
                              fontFamilyFallback: ["Regular"],
                              color: Colors.grey),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 20,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                color: Colors.grey.shade800,
                thickness: 1,
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Connect to Us",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: "OpenSans",
                          fontFamilyFallback: ["Regular"],
                          color: Colors.black),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                color: Colors.grey.shade800,
                thickness: 1,
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "About CRS",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: "OpenSans",
                          fontFamilyFallback: ["Regular"],
                          color: Colors.black),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Global.primary),
                  child: Center(
                    child: Text(
                      "SIGN OUT",
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
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "Version 7.9.0",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      fontFamily: "OpenSans",
                      fontFamilyFallback: ["Regular"],
                      color: Colors.grey),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
