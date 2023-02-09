// ignore_for_file: prefer_const_constructors

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:easy_localization/easy_localization.dart';
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
import 'package:flutter_introduction_app_ard_grup/widgets/customCalendar.dart';

import '../../l10n/locale_keys.g.dart';
import '../../widgets/cardWidgets/customCardWithImage.dart';
import '../../widgets/cardWidgets/customCardWithImageSmall.dart';
import '../../widgets/dialogWidgets/customAlertDialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login/login.dart';

class OtherWidgetsView extends StatefulWidget {
  const OtherWidgetsView({super.key});

  @override
  State<OtherWidgetsView> createState() => _OtherWidgetsViewState();
}

class _OtherWidgetsViewState extends State<OtherWidgetsView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        CustomAlertDialog(context, () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          var lang = prefs.getString("lang");
          prefs.clear();
          prefs.setString("lang", lang!);
          // ignore: use_build_context_synchronously
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Login()),
              (route) => true);
        },
            LocaleKeys.eminMisiniz.tr(),
            LocaleKeys.cikisYapilacaktir.tr(),
            ArtSweetAlertType.info,
            LocaleKeys.tamam.tr(),
            LocaleKeys.vazgec.tr());
        return true;
      },
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 15),
                child: CustomCardWithImage(
                  cardName: LocaleKeys.widgetOrnekleri.tr(),
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
                            title: LocaleKeys.textFieldOrnekleri.tr(),
                            iconData: Icons.text_fields,
                            cardPadding: 0,
                            cardInlinePadding: 10,
                            navigation: ExampleTextFormFields(),
                          ),
                          CustomCardWithImageSmall(
                            title: LocaleKeys.butonOrnekleri.tr(),
                            iconData: Icons.smart_button_sharp,
                            cardPadding: 10,
                            navigation: ExampleButtons(),
                          ),
                          CustomCardWithImageSmall(
                            title: LocaleKeys.takvimOrnegi.tr(),
                            iconData: Icons.calendar_month,
                            cardPadding: 10,
                            navigation: ExampleCalendar(),
                          ),
                          CustomCardWithImageSmall(
                            title: LocaleKeys.dialogOrnekleri.tr(),
                            cardPadding: 10,
                            iconData: Icons.chat,
                            navigation: ExampleDialogs(),
                          ),
                          CustomCardWithImageSmall(
                            title: LocaleKeys.cardOrnekleri.tr(),
                            cardPadding: 10,
                            iconData: Icons.article_sharp,
                            navigation: ExampleCards(),
                          ),
                          CustomCardWithImageSmall(
                            title: LocaleKeys.listOrnekleri.tr(),
                            cardPadding: 10,
                            iconData: Icons.list,
                            navigation: ExampleListTiles(),
                          ),
                        ]),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
