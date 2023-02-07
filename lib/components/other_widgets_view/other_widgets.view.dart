// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_introduction_app_ard_grup/components/other_widgets_view/widget_pages/example_buttons.dart';
import 'package:flutter_introduction_app_ard_grup/components/other_widgets_view/widget_pages/example_calendar.dart';
import 'package:flutter_introduction_app_ard_grup/components/other_widgets_view/widget_pages/example_cards.dart';
import 'package:flutter_introduction_app_ard_grup/components/other_widgets_view/widget_pages/example_dialogs.dart';
import 'package:flutter_introduction_app_ard_grup/components/other_widgets_view/widget_pages/example_list_tiles.dart';
import 'package:flutter_introduction_app_ard_grup/components/other_widgets_view/widget_pages/text_form_fields.dart';
import 'package:flutter_introduction_app_ard_grup/utils/themes.dart';
import 'package:flutter_introduction_app_ard_grup/utils/utils.dart';
import 'package:flutter_introduction_app_ard_grup/widgets/other_widgets/customCalendar.dart';

import '../../widgets/cardWidgets/customCardWithImage.dart';
import '../../widgets/cardWidgets/customCardWithImageSmall.dart';

class OtherWidgetsView extends StatefulWidget {
  const OtherWidgetsView({super.key});

  @override
  State<OtherWidgetsView> createState() => _OtherWidgetsViewState();
}

class _OtherWidgetsViewState extends State<OtherWidgetsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 50),
              child: CustomCardWithImage(
                cardName: "Widget Örnekleri",
                isIcon: false,
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(20),
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      padding: EdgeInsets.all(0),
                      mainAxisSpacing: 20,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 20,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                        CustomCardWithImageSmall(
                          title: "TextField Örnekleri",
                          iconData: Icons.text_fields,
                          cardPadding: 0,
                          cardInlinePadding: 10,
                          navigation: ExampleTextFormFields(),
                        ),
                        CustomCardWithImageSmall(
                          title: "Buton Örnekleri",
                          iconData: Icons.smart_button_sharp,
                          cardPadding: 10,
                          navigation: ExampleButtons(),
                        ),
                        CustomCardWithImageSmall(
                          title: "Takvim Örneği",
                          iconData: Icons.calendar_month,
                          cardPadding: 10,
                          navigation: ExampleCalendar(),
                        ),
                        CustomCardWithImageSmall(
                          title: "Dialog Örnekleri",
                          cardPadding: 10,
                          iconData: Icons.chat,
                          navigation: ExampleDialogs(),
                        ),
                        CustomCardWithImageSmall(
                          title: "Card Örnekleri",
                          cardPadding: 10,
                          iconData: Icons.article_sharp,
                          navigation: ExampleCards(),
                        ),
                        CustomCardWithImageSmall(
                          title: "List Örnekleri",
                          cardPadding: 10,
                          iconData: Icons.list,
                          navigation: ExampleListTiles(),
                        ),
                      ]),
                ],
              ),
            ),
          ],
        ));
    //     body: ListView(
    //   scrollDirection: Axis.vertical,
    //   children: [
    //     // ignore: prefer_const_constructors
    //     CustomCardWithImage(
    //       cardName: "Textformfield Örnekleri",
    //       onPressed: () {
    //         Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //                 builder: (context) => ExampleTextFormFields()));
    //       },
    //     ),
    //     CustomCardWithImage(
    //       cardName: "Buton Örnekleri",
    //       onPressed: () {
    //         Navigator.push(context,
    //             MaterialPageRoute(builder: (context) => ExampleButtons()));
    //       },
    //     ),
    //     CustomCardWithImage(
    //       cardName: "Takvim Örneği",
    //       onPressed: () {
    //         Navigator.push(context,
    //             MaterialPageRoute(builder: (context) => ExampleCalendar()));
    //       },
    //     ),
    //     CustomCardWithImage(
    //       cardName: "Dialog Örnekleri",
    //       onPressed: () {
    //         Navigator.push(context,
    //             MaterialPageRoute(builder: (context) => ExampleDialogs()));
    //       },
    //     ),
    //   ],
    // ));
  }
}
