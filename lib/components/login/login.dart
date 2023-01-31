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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            spaceArea(height_90),
            headerArea(),
            spaceArea(height_30),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: mainWhiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(radius_size_50),
                    topRight: Radius.circular(radius_size_50),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(radius_size_30),
                    child: Column(
                      children: <Widget>[
                        spaceArea(height_50),
                        inputArea(),
                        spaceArea(height_50),
                        loginArea(),
                        customDivider(null),
                        forgetPasswordArea()
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

  Widget inputArea() {
    return Container(
      decoration: BoxDecoration(
          color: mainWhiteColor,
          borderRadius: BorderRadius.circular(radius_size_10),
          boxShadow: [
            BoxShadow(
                color: container_box_shadow,
                blurRadius: radius_size_10,
                offset: Offset(radius_size_0, radius_size_10))
          ]),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(radius_size_10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: mainGreyColor))),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "E-mail",
                  hintStyle: TextStyle(color: mainGreyColor),
                  border: InputBorder.none),
            ),
          ),
          Container(
            padding: EdgeInsets.all(height_10),
            decoration: BoxDecoration(border: Border()),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Şifre",
                  hintStyle: TextStyle(color: mainGreyColor),
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }

  Widget forgetPasswordArea() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(height_3),
          child: Text(
            "Şifremi unuttum",
            style: TextStyle(color: mainGreyColor),
          ),
        ),
      ],
    );
  }

  Widget loginArea() {
    return Container(
      height: height_50,
      margin: EdgeInsets.symmetric(horizontal: height_50),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius_size_10),
          color: mainColor),
      child: Center(
        child: Text(
          "Giriş",
          style: TextStyle(
              color: mainWhiteColor,
              fontSize: font_size_18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget headerArea() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ard_logo_url),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(height_10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Hoşgeldin",
                style: TextStyle(color: mainWhiteColor, fontSize: font_size_24),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
