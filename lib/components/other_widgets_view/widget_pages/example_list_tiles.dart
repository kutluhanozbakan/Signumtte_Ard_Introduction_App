// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../widgets/ListWidgets/customDefaultListWidgets.dart';
import '../../../widgets/cardWidgets/customCardWithImage.dart';
import '../../../widgets/customListTile.dart';
import '../../../widgets/customTaskListWidget.dart';

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
                child: AppListTileWithAvatar(
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
                child: TaskListWidget(
                  iconOnPressed: () {},
                  importanceLevelColor: Colors.green,
                  taskDate: "12.12.2023",
                  taskNo: "Deneme",
                  taskSubject: "Deneme Başlık 3",
                  taskPerson: "Test",
                  isIcon: true,
                  taskProjectName: "Lorem ipsum dolor sit amet",
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
              // Padding(
              //   padding:
              //       EdgeInsets.all(MediaQuery.of(context).size.height / 35),
              //   child: ListWidgetExtended(
              //     childrenLeftSide: [Text("Lorem ipsum dolor sit amet")],
              //     childrenRightSide: [Text("12.12.2023")],
              //     isButton: true,
              //     isTitle: true,
              //     press: () {},
              //     title: "Örnek Başlık 4",
              //   ),
              // )
            ],
          )
        ],
      ),
    );
  }
}
