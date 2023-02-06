// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_introduction_app_ard_grup/utils/themes.dart';
import 'package:flutter_introduction_app_ard_grup/utils/utils.dart';
import 'package:flutter_introduction_app_ard_grup/widgets/buttonWidgets/customButtonWithGradient.dart';
import 'package:flutter_introduction_app_ard_grup/widgets/buttonWidgets/customIconButton.dart';
import 'package:flutter_introduction_app_ard_grup/widgets/commons.dart';
import '../../../widgets/cardWidgets/customCardWithImage.dart';

class ExampleButtons extends StatefulWidget {
  const ExampleButtons({super.key});

  @override
  State<ExampleButtons> createState() => _ExampleButtonsState();
}

class _ExampleButtonsState extends State<ExampleButtons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
        child: Column(
          children: [
            CustomCardWithImage(
              cardName: "Buton Örnekleri",
              isIcon: false,
            ),
            buttonExample_1(context),
            customDivider(20),
            buttonExample_2(context),
            customDivider(20),
            buttonExample_3(context),
            customDivider(20),
            CustomIconButton(
              width: 2,
              textInlinePadding: 10,
              icons: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.save,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget buttonExample_1(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width / 2,
    child: ElevatedButton(
      onPressed: () {},
      child: Text("Button"),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blue[300]),
        minimumSize: MaterialStateProperty.all(Size.square(60)),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        elevation: MaterialStateProperty.all(2),
      ),
    ),
  );
}

Widget buttonExample_2(BuildContext context) {
  return SizedBox(
    height: 50,
    width: MediaQuery.of(context).size.width / 2,
    child: ElevatedButton(
        onPressed: () {},
        child: Text("Button"),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(APPColors.Secondary.orange),
            overlayColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(57, 255, 255, 255)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(
                        color: Color.fromARGB(255, 255, 231, 15)))))),
  );
}

Widget buttonExample_3(BuildContext context) {
  return CustomButtonWithGradient(
    width: MediaQuery.of(context).size.width / 2,
    onPressed: () {},
    borderRadius: BorderRadius.circular(20),
    child: Text('SIGN IN'),
  );
}
