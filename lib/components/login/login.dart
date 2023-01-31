// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import '../../widgets/commons.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter, colors: login_ui_color)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            spaceArea(height_90),
            Padding(
              padding: EdgeInsets.all(height_30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "ARD GRUP",
                    style:
                        TextStyle(color: Colors.white, fontSize: font_size_32),
                  ),
                  spaceArea(height_10),
                  Text(
                    "Hoşgeldin",
                    style:
                        TextStyle(color: Colors.white, fontSize: font_size_18),
                  ),
                ],
              ),
            ),
            spaceArea(height_30),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(radius_size_50),
                        topRight: Radius.circular(radius_size_50))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(radius_size_30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: height_50,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(radius_size_10),
                              boxShadow: [
                                BoxShadow(
                                    color: container_box_shadow,
                                    blurRadius: radius_size_10,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(radius_size_10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "E-mail",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(height_10),
                                decoration: BoxDecoration(border: Border()),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Şifre",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(height_10),
                              child: Text(
                                "Şifremi unuttum",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        spaceArea(height_50),
                        Container(
                          height: height_50,
                          margin: EdgeInsets.symmetric(horizontal: height_50),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(radius_size_10),
                              color: Color.fromARGB(255, 55, 82, 255)),
                          child: Center(
                            child: Text(
                              "Giriş",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: font_size_18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
