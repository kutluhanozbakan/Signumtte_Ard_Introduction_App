// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_introduction_app_ard_grup/providers/login_provider.dart';
import 'package:flutter_introduction_app_ard_grup/utils/themes.dart';
import 'package:flutter_introduction_app_ard_grup/widgets/buttonWidgets/customButton.dart';
import 'package:flutter_introduction_app_ard_grup/widgets/customTextFormField.dart';
import '../../utils/global_utils.dart';
import '../../utils/utils.dart';
import '../../widgets/commons.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
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
              spaceArea(height_50),
              headerArea(),
              spaceArea(height_10),
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
                      padding:
                          EdgeInsets.only(left: height_30, right: height_30),
                      child: Column(
                        children: <Widget>[
                          spaceArea(height_50),
                          inputArea(),
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
              child: Padding(
                padding: const EdgeInsets.all(height_10),
                child: Column(
                  children: <Widget>[
                    CustomTextFormFieldContent(
                        controller: loginProvider.userName,
                        name: "E-mail",
                        validator: formEmail,
                        isIcon: true),
                    CustomTextFormFieldContent(
                        controller: loginProvider.password,
                        name: "Şifre",
                        validator: formBos,
                        obscureText: loginProvider.passwordVisible,
                        icon: Icons.password,
                        isSuffix: true,
                        suffixIcon: loginProvider.passwordVisible
                            ? Icons.remove_red_eye_sharp
                            : Icons.remove_red_eye_outlined,
                        onSuffixTap: () {
                          setState(() {
                            loginProvider.setPasswordVisible =
                                !loginProvider.passwordVisible;
                          });
                        },
                        isIcon: true),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Beni hatırla"),
                Checkbox(
                    value: loginProvider.rememberMe,
                    onChanged: (val) {
                      loginProvider.setRememberMe = !loginProvider.rememberMe;
                    }),
              ],
            ),
            Padding(
                padding: EdgeInsets.only(top: height_50),
                child: CustomButton(
                  isIcon: false,
                  colors: APPColors.Main.blue,
                  name: "Giriş",
                  onTap: () {
                    if (_loginFormKey.currentState!.validate()) {
                      loginProvider.userLogin(
                          loginProvider.userName.text,
                          loginProvider.password.text,
                          context,
                          loginProvider.rememberMe);
                    }
                  },
                  textColor: APPColors.Main.white,
                ))
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
            Image.asset(APPImages.splashScreen.images),
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
