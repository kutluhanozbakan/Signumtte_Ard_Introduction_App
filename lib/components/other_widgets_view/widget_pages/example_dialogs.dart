// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_introduction_app_ard_grup/utils/themes.dart';
import 'package:flutter_introduction_app_ard_grup/widgets/buttonWidgets/customButtonWithGradient.dart';
import 'package:flutter_introduction_app_ard_grup/widgets/commons.dart';
import 'package:flutter_introduction_app_ard_grup/widgets/dialogWidgets/customCuppertinoDialog2.dart';

import '../../../utils/global_utils.dart';
import '../../../widgets/cardWidgets/customCardWithImage.dart';
import '../../../widgets/dialogWidgets/customActionSheetBottomDialog.dart';
import '../../../widgets/dialogWidgets/customAlertDialog.dart';
import '../../../widgets/dialogWidgets/customCuppertinoDialog.dart';

class ExampleDialogs extends StatefulWidget {
  const ExampleDialogs({super.key});

  @override
  State<ExampleDialogs> createState() => _ExampleDialogsState();
}

class _ExampleDialogsState extends State<ExampleDialogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 38.0),
          child: CustomCardWithImage(
            cardName: "Örnek Dialoglar",
            imageUrl: APPImages.splashScreen.images,
            isIcon: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 58.0),
          child: CustomButtonWithGradient(
              onPressed: () {
                CustomCuppertinoDialogs1(
                    context,
                    "Örnek Dialog Başlığı",
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                    "Tamam",
                    "İptal", () {
                  Navigator.pop(context);
                }, () {
                  Navigator.pop(context);
                });
              },
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text("Örnek 1")),
        ),
        customDivider(20),
        CustomButtonWithGradient(
            gradient: LinearGradient(
                colors: [APPColors.Main.red, APPColors.Main.white]),
            onPressed: () {
              CustomCuppertinoDialog2(
                  context,
                  "Örnek Dialog Başlığı",
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                  "Tamam", () {
                Navigator.pop(context);
              });
            },
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text("Örnek 2")),
        customDivider(20),
        CustomButtonWithGradient(
            gradient: LinearGradient(
                colors: [APPColors.Accent.orange, APPColors.Main.white]),
            onPressed: () {
              CustomDialogActionSheet(
                  context,
                  "Örnek Dialog Başlığı",
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                  [
                    CustomDialogActionSheetButtons(context, "Action 1"),
                    CustomDialogActionSheetButtons(context, "Action 2"),
                    CustomDialogActionSheetButtons(context, "Action 3"),
                  ]);
            },
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text("Örnek 3")),
        customDivider(20),
        CustomButtonWithGradient(
            gradient:
                LinearGradient(colors: [Colors.green, APPColors.Main.white]),
            onPressed: () {
              CustomDialogActionSheet(
                  context,
                  "Örnek Dialog Başlığı",
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                  [
                    CustomDialogActionSheetButtons(context, "Action 1"),
                    CustomDialogActionSheetButtons(context, "Action 2"),
                    CustomDialogActionSheetButtons(context, "Action 3"),
                  ]);
            },
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text("Örnek 4")),
      ]),
    );
  }
}
