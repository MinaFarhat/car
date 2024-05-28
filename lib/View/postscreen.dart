import 'package:car/View/homescreen.dart';
import 'package:car/View/listpost.dart';
import 'package:car/api/api.dart';
import 'package:car/const/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Post extends StatefulWidget {
  String? imagep;
  String? name;
  String? image;
  String? price;
  String? type;
  String? year;
  Post(this.imagep, this.name, this.image, this.price, this.type, this.year,
      {Key? key})
      : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  Homescreen d = Homescreen();
  @override
  Widget build(BuildContext context) {
    print(Api.url + "/uploads/" + widget.imagep!);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(Api.url + "/uploads/" + widget.image!),
                radius: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                widget.name!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "OpenSans",
                  fontFamilyFallback: ["Regular"],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.23,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image:  NetworkImage(Api.url + "/uploads/" + widget.image!),
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "DAILY RENT  ${widget.price} AED",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: "OpenSans",
              fontFamilyFallback: ["Regular"],
              color: Global.primary,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            widget.type!,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              fontFamily: "OpenSans",
              fontFamilyFallback: ["Regular"],
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "Year : ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: "OpenSans",
                  fontFamilyFallback: ["Regular"],
                  color: Colors.black,
                ),
              ),
              Text(
                widget.year!,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: "OpenSans",
                  fontFamilyFallback: ["Regular"],
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.44,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Global.primary,
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Book Via Phone",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              fontFamily: "OpenSans",
                              fontFamilyFallback: ["Regular"],
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.44,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Global.primary,
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon(
                        //   Icons.whatsapp,
                        //   color: Colors.white,
                        // ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Book Via Whatsapp",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              fontFamily: "OpenSans",
                              fontFamilyFallback: ["Regular"],
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
