// ignore_for_file:file_names, prefer_const_constructors_in_immutables,prefer_const_constructors,prefer_const_literals_to_create_immutables,use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_introduction_app_ard_grup/utils/themes.dart';

class ListWidgetExtendedContent extends StatefulWidget {
  final String? name;
  final bool isIcon;
  final IconData icon;
  final Color iconColors;

  const ListWidgetExtendedContent({
    Key? key,
    this.name,
    this.isIcon = false,
    this.icon = Icons.date_range,
    this.iconColors = Colors.grey,
  }) : super(key: key);

  @override
  State<ListWidgetExtendedContent> createState() =>
      _ListWidgetExtendedContentState();
}

class _ListWidgetExtendedContentState extends State<ListWidgetExtendedContent> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          widget.isIcon
              ? Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width / 30),
                  child: Icon(
                    widget.icon,
                    color: widget.iconColors,
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width / 30),
                  child: Icon(
                    widget.icon,
                    color: APPColors.Main.white,
                  ),
                ),
          Container(
            width: MediaQuery.of(context).size.width / 3.5,
            child: Text(
              widget.name.toString(),
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
            ),
          ),
        ],
      ),
    );
  }
}

class ListWidgetExtended extends StatefulWidget {
  final Color? importanceLevelColor;
  final List<Widget> childrenLeftSide;
  final List<Widget> childrenRightSide;
  final VoidCallback? press;
  final String title;
  final bool isButton;
  final bool isTitle;
  const ListWidgetExtended(
      {Key? key,
      this.press,
      this.importanceLevelColor,
      required this.childrenLeftSide,
      required this.childrenRightSide,
      this.title = "",
      this.isTitle = false,
      this.isButton = false})
      : super(key: key);

  @override
  State<ListWidgetExtended> createState() => _ListWidgetExtendedState();
}

class _ListWidgetExtendedState extends State<ListWidgetExtended> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: widget.press,
        child: Container(
          width: size.width,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0x19025273),
                blurRadius: 12,
                offset: Offset(6, 8),
              ),
            ],
            color: Color(0xfff6f6f6),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
            child: Column(
              children: [
                widget.isTitle
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.title,
                            ),
                            widget.isButton
                                ? ElevatedButton(
                                    onPressed: widget.press,
                                    child: Icon(
                                      Icons.check,
                                      color: APPColors.Main.white,
                                    ))
                                : Container(),
                          ],
                        ))
                    : Container(),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.childrenLeftSide,
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: widget.childrenRightSide,
                        ),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TaskListWidget extends StatelessWidget {
  final String? taskSubject, taskProjectName, taskNo, taskPerson, taskDate;
  final Color? importanceLevelColor;

  final VoidCallback? press;
  final bool isIcon;
  final VoidCallback? iconOnPressed;
  const TaskListWidget(
      {Key? key,
      this.taskSubject,
      this.taskProjectName,
      this.taskNo,
      this.taskPerson,
      this.taskDate,
      this.press,
      this.importanceLevelColor,
      this.isIcon = false,
      this.iconOnPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: press,
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x19025273),
              blurRadius: 12,
              offset: Offset(6, 8),
            ),
          ],
          color: Color(0xfff6f6f6),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 0, left: 0, right: 12, bottom: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Column(
                  children: [
                    Container(
                      color: importanceLevelColor!,
                      width: MediaQuery.of(context).size.width / 50,
                      height: MediaQuery.of(context).size.height / 12,
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: SizedBox(
                      width: size.width / 2.0,
                      child: Text(
                        taskSubject.toString(),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Color(0xff025273),
                          fontSize: 14,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  taskPerson.toString() != ""
                      ? SizedBox(height: 3)
                      : Container(),
                  taskPerson.toString() != ""
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text(
                            taskPerson.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Color(0xff025273),
                              fontSize: 13,
                            ),
                          ),
                        )
                      : Container(),
                  SizedBox(height: 6),
                  Flexible(
                    child: Text(
                      taskProjectName.toString(),
                      style: TextStyle(
                        color: Color(0xff025273),
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        taskNo.toString(),
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xff025273),
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        taskDate.toString(),
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xff025273),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  isIcon
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width / 18,
                          child: IconButton(
                            onPressed: isIcon ? iconOnPressed : () {},
                            icon: Icon(Icons.info),
                            color: APPColors.Main.blue,
                          ),
                        )
                      : SizedBox(
                          width: MediaQuery.of(context).size.width / 18,
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
