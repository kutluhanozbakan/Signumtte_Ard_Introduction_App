// ignore_for_file: prefer_const_constructors

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_introduction_app_ard_grup/utils/themes.dart';
import 'package:flutter_introduction_app_ard_grup/widgets/buttonWidgets/customButton.dart';
import 'package:flutter_introduction_app_ard_grup/widgets/buttonWidgets/customButtonWithGradient.dart';
import 'package:flutter_introduction_app_ard_grup/widgets/commons.dart';
import 'package:flutter_introduction_app_ard_grup/widgets/dialogWidgets/customCuppertinoDialog2.dart';
import 'package:flutter_introduction_app_ard_grup/widgets/dialogWidgets/customDialogOnlyConfirm.dart';

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
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 50),
          child: CustomCardWithImage(
            cardName: "Örnek Dialoglar",
            imageUrl: APPImages.splashScreen.images,
            isIcon: false,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomButton(
              name: "Success",
              isIcon: true,
              icons: Icons.check,
              inlinePadding: 8,
              colors: Colors.green,
              onTap: () {
                CustomAlertDialogOnlyConfirm(context, () {
                  Navigator.pop(context);
                }, "Örnek 4", "Örnek Dialog Örnek 4", ArtSweetAlertType.success,
                    "Tamam");
              },
              width: MediaQuery.of(context).size.width / 90,
            ),
            CustomButton(
              name: "Warning",
              isIcon: true,
              icons: Icons.warning,
              inlinePadding: 8,
              colors: Colors.orangeAccent,
              onTap: () {
                CustomAlertDialogOnlyConfirm(context, () {
                  Navigator.pop(context);
                }, "Örnek 4", "Örnek Dialog Örnek 4", ArtSweetAlertType.warning,
                    "Tamam");
              },
              width: MediaQuery.of(context).size.width / 90,
            ),
            CustomButton(
              name: "Info",
              inlinePadding: 8,
              icons: Icons.info,
              isIcon: true,
              colors: Colors.grey,
              onTap: () {
                CustomAlertDialogOnlyConfirm(context, () {
                  Navigator.pop(context);
                }, "Örnek 4", "Örnek Dialog Örnek 4", ArtSweetAlertType.info,
                    "Tamam");
              },
              width: MediaQuery.of(context).size.width / 65,
            ),
          ],
        ),
        customDivider(20),
        CustomButtonWithGradient(
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
            child: Text("Cuppertino Dialog 1")),
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
            child: Text("Cuppertino Dialog 2")),
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
            child: Text("Cuppertino Dialog 3")),
      ]),
    );
  }
}
