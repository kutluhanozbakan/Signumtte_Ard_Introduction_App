// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_introduction_app_ard_grup/providers/login_provider.dart';

import '../../common/global_utils.dart';
import '../../common/utils.dart';
import '../../widgets/commons.dart';
import 'listview.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ChangeNotifierProvider(
        create: ((context) => RegistrationProvider()),
        child: Container(
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
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget inputArea() {
    return Consumer<RegistrationProvider>(
        builder: (context, loginProvider, child) {
      return Form(
        key: _loginFormKey,
        child: Column(
          children: [
            Container(
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
                        border:
                            Border(bottom: BorderSide(color: mainGreyColor))),
                    child: TextFormField(
                      validator: formEmail,
                      controller: loginProvider.userName,
                      decoration: InputDecoration(
                          hintText: "E-mail",
                          hintStyle: TextStyle(color: mainGreyColor),
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(height_10),
                    decoration: BoxDecoration(border: Border()),
                    child: TextFormField(
                      validator: formPassword,
                      controller: loginProvider.password,
                      decoration: InputDecoration(
                          hintText: "Şifre",
                          hintStyle: TextStyle(color: mainGreyColor),
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height_30),
              child: InkWell(
                onTap: () {
                  if (_loginFormKey.currentState!.validate()) {
                    loginProvider.userLogin(
                      loginProvider.userName.text,
                      loginProvider.password.text,
                      context,
                    );
                  }
                },
                child: Container(
                  height: height_50,
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
                ),
              ),
            )
          ],
        ),
      );
    });
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
