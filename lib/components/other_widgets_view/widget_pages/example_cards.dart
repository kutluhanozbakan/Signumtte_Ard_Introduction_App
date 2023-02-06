import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_introduction_app_ard_grup/utils/themes.dart';
import 'package:flutter_introduction_app_ard_grup/widgets/cardWidgets/customCardWidget.dart';

import '../../../widgets/cardWidgets/customCardWithImage.dart';
import '../../../widgets/cardWidgets/customCardWithImageSmall.dart';

class ExampleCards extends StatefulWidget {
  const ExampleCards({super.key});

  @override
  State<ExampleCards> createState() => _ExampleCardsState();
}

class _ExampleCardsState extends State<ExampleCards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 58.0),
            child: CustomCardWithImage(
              cardName: "Card Örnekleri",
              isIcon: false,
            ),
          ),
          CustomBox(
            icon: Icons.info_outline,
            isIcon: true,
            iconSize: 50,
            descriptionPadding: 10,
            width: MediaQuery.of(context).size.width / 1.12,
            height: MediaQuery.of(context).size.height / 6,
            description: "Örnek Açıklama",
            boxColor: APPColors.Main.blue,
            title: "Başlık",
            titleColor: Colors.white,
          ),
          CustomCardWithImage(
            cardName: "Örnek Card 1",
            imageUrl: APPImages.defaultImage.images,
            isIcon: false,
          ),
          CustomCardWithImageSmall(
            backgroundColor: APPColors.Secondary.orange,
            iconColor: APPColors.Main.white,
            textColor: APPColors.Main.white,
            icon: APPImages.defaultImage.images,
            title: "Örnek",
            isNavigation: false,
          )
        ],
      ),
    );
  }
}
