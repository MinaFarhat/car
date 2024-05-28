import 'package:car/View/homescreen.dart';
import 'package:car/View/mynavbar.dart';
import 'package:car/api/api.dart';
import 'package:car/const/global.dart';
import 'package:car/const/shp.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  int v = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/car2.png"),
                  )),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height - 500,
                  child: v == 0
                      ? Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: TextFormField(
                                controller: emailAddress,
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
                                  hintText: "User Name",
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
                                  MediaQuery.of(context).size.height * 0.035,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.length < 5) {
                                    return ErrorHint(
                                            "Your Password is too short ,it must 8 character")
                                        .toString();
                                  }
                                  return null;
                                },
                                controller: password,
                                obscureText: true,
                                obscuringCharacter: "*",
                                enableSuggestions: true,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    letterSpacing: 6),
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
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: 1,
                                  ),
                                ),
                                keyboardType: TextInputType.visiblePassword,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.06,
                            ),
                            (emailAddress.text.isEmpty || password.text.isEmpty)
                                ? Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.grey.shade900),
                                    child: Center(
                                      child: Text(
                                        "Log in",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontFamily: "OpenSans",
                                          fontFamilyFallback: ["Regular"],
                                        ),
                                      ),
                                    ),
                                  )
                                : InkWell(
                                    overlayColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                    onTap: () {
                                      if (formkey.currentState!.validate()) {
                                        Api.login(emailAddress.text,
                                                password.text)
                                            .then((value) {
                                          if (value == true) {
                                            Global.savedata!.username = emailAddress.text;
                                            Global.savedata!.password = password.text;
                                           Shp.saveloginfo();
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                              return Mynavbar();
                                            }));
                                          } else {
                                            showTopSnackBar(
                                                displayDuration:
                                                    Duration(milliseconds: 500),
                                                context,
                                                CustomSnackBar.error(
                                                    message:
                                                        "your information not true!"));
                                          }
                                        });
                                      }
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: Global.primary,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Log in",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontFamily: "OpenSans",
                                            fontFamilyFallback: ["Regular"],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                            const Spacer(),
                            InkWell(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              onTap: () {
                                setState(() {
                                  v = 1;
                                });
                              },
                              child: const Center(
                                child: Text(
                                  "Contact Us To Sign Up",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            InkWell(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              onTap: () {},
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey.shade900,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image:
                                            AssetImage("assets/whatsapp.png"),
                                        fit: BoxFit.cover,
                                      )),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      "Call Us Whatsapp",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.035,
                            ),
                            InkWell(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              onTap: () {},
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey.shade900,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      "Call Us",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              onTap: () {
                                setState(() {
                                  v = 0;
                                });
                              },
                              child: const Center(
                                child: Text(
                                  "Tab To Log in",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
