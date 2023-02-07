// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_introduction_app_ard_grup/utils/themes.dart';
import 'package:flutter_introduction_app_ard_grup/widgets/commons.dart';
import 'package:flutter_introduction_app_ard_grup/widgets/textfieldsWidgets/customTextFormField.dart';
import 'package:flutter_introduction_app_ard_grup/widgets/textfieldsWidgets/customTextArea.dart';

import '../../../widgets/cardWidgets/customCardWithImage.dart';

class ExampleTextFormFields extends StatefulWidget {
  const ExampleTextFormFields({super.key});

  @override
  State<ExampleTextFormFields> createState() => _ExampleTextFormFieldsState();
}

TextEditingController _exampleController = new TextEditingController();

class _ExampleTextFormFieldsState extends State<ExampleTextFormFields> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 50),
              child: CustomCardWithImage(
                cardName: "TextFormField Örnekleri",
                isIcon: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: CustomTextFormFieldContent(
                name: "Adınız",
                controller: _exampleController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormFieldExample_1(),
            ),
            customDivider(20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormFieldExample_2(),
            ),
            customDivider(10),
            CustomTextArea(),
            customDivider(10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormFieldExample_3(),
            ),
          ],
        ),
      ]),
    );
  }
}

Widget TextFormFieldExample_1() {
  return TextFormField(
    decoration: InputDecoration(
      labelStyle: TextStyle(color: APPColors.Main.blue),
      labelText: "Adınız",
      hintText: "Adınızı girin",
      prefixIcon: Icon(
        Icons.person,
        color: APPColors.Main.blue,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: APPColors.Main.orange,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromARGB(255, 0, 189, 9),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      filled: true,
      fillColor: Colors.white,
    ),
  );
}

Widget TextFormFieldExample_2() {
  return TextFormField(
    decoration: InputDecoration(
      labelText: "Şifre",
      prefixIcon: Icon(Icons.lock),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blue,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      filled: true,
      fillColor: Colors.white,
      suffixIcon: IconButton(
        icon: Icon(Icons.visibility),
        onPressed: () {
          // şifre görünür/görünmez yap
        },
      ),
    ),
  );
}

Widget TextFormFieldExample_3() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(95, 173, 173, 173),
            borderRadius: new BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 5),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Email',
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
