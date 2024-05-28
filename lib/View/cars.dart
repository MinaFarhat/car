import 'package:car/View/cartype.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../const/global.dart';

class Cars extends StatefulWidget {
  const Cars({Key? key}) : super(key: key);

  @override
  State<Cars> createState() => _CarsState();
}

class _CarsState extends State<Cars> {
  List<String> names = ["All Cars", "BMW", "Bentley", "BYD", "Bugatti"];
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.22,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Row(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              child: Text(
                                "NEXT",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.75,
                              height: MediaQuery.of(context).size.height * 0.09,
                              decoration: BoxDecoration(
                                  // color: Colors.red,
                                  image: DecorationImage(
                                image: AssetImage("assets/logo.png"),
                                fit: BoxFit.cover,
                              )),
                            ),
                            InkWell(
                              onTap: () {
                                if (currentindex == 0) {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return Cartype("Types of Cars");
                                  }));
                                } else
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return Cartype(names[currentindex]);
                                  }));
                              },
                              child: Text(
                                "NEXT",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: Text(
                            "Welcome to CRC",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Please Select The Car Brand",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 45,
                    child: TextFormField(
                      cursorHeight: 25,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: Colors.black,
                          ),
                          hintText: "Search here",
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 12,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.72,
              child: ListView.builder(
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: InkWell(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      onTap: () {
                        setState(() {
                          currentindex = index;
                        });
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 35,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                names[index],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "OpenSans",
                                  fontFamilyFallback: ["Bold"],
                                ),
                              ),
                              currentindex == index
                                  ? Icon(
                                      Icons.done_rounded,
                                      color: Global.primary,
                                      size: 17,
                                    )
                                  : Container(),
                            ],
                          ),
                          Divider(
                            color: Colors.grey.shade900,
                            thickness: 1,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
