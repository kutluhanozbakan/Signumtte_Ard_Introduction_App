// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../widgets/ListWidgets/customDefaultListWidgets.dart';
import '../../../widgets/ListWidgets/customListWithAvatar.dart';
import '../../../widgets/cardWidgets/customCardWithImage.dart';
import '../../../widgets/ListWidgets/customListWidgetSimple.dart';
import '../../../widgets/ListWidgets/customTaskListWidget.dart';

class ExampleListTiles extends StatefulWidget {
  const ExampleListTiles({super.key});

  @override
  State<ExampleListTiles> createState() => _ExampleListTilesState();
}

class _ExampleListTilesState extends State<ExampleListTiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 50),
            child: CustomCardWithImage(
              cardName: "List Örnekleri",
              isIcon: false,
            ),
          ),
          Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              CustomDefaultListWidgets(
                icon: Icons.info,
                title: "Örnek Başlık 2",
                endTitle: "12/01/2023",
                iconColors: Colors.green,
                subTitle:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit ",
                isIcon: false,
              ),
              Padding(
                padding: EdgeInsets.only(left: 40.0, right: 38, top: 25),
                child: CustomListWithAvatar(
                  icon: Icons.info,
                  onTap: () {},
                  iconText: "1",
                  iconColor: Colors.green,
                  extraTitle: "Lorem ipsum dolor sit amet",
                  title: "Başlık 4",
                  subTitle: "alt başlık",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 40.0, right: 38, top: 25),
                child: CustomListWidgetSimple(
                  icon: Icons.info,
                  baslik: "Test",
                  icerik: "İçerik",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 40.0, right: 38, top: 25),
                child: TaskListWidget(
                  iconOnPressed: () {},
                  importanceLevelColor: Colors.green,
                  trailing: "12.12.2023",
                  taskNo: "Deneme",
                  title: "Deneme Başlık 3",
                  subTitle: "Test",
                  isIcon: true,
                  extraTitle: "Lorem ipsum dolor sit amet",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: CustomDefaultListWidgets(
                  icon: Icons.info,
                  title: "Örnek Başlık 1",
                  endTitle: "12/01/2023",
                  iconColors: Colors.green,
                  isIcon: true,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
