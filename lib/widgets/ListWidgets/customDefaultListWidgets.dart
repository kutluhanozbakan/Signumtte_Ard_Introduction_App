import 'package:flutter/material.dart';

import '../../utils/themes.dart';
import '../../utils/utils.dart';

class CustomDefaultListWidgets extends StatefulWidget {
  final String? title;
  final String? subTitle;
  final String? endTitle;
  final bool isIcon;
  final IconData icon;
  final Color iconColors;

  const CustomDefaultListWidgets({
    Key? key,
    this.title = "",
    this.isIcon = false,
    this.icon = Icons.date_range,
    this.iconColors = Colors.grey,
    this.subTitle = "",
    this.endTitle = "",
  }) : super(key: key);

  @override
  State<CustomDefaultListWidgets> createState() =>
      _CustomDefaultListWidgetsState();
}

class _CustomDefaultListWidgetsState extends State<CustomDefaultListWidgets> {
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
                      right: MediaQuery.of(context).size.width / 30,
                      left: MediaQuery.of(context).size.width / 30),
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
              decoration: BoxDecoration(
                  color: mainWhiteColor,
                  borderRadius: BorderRadius.circular(radius_size_10),
                  boxShadow: [
                    BoxShadow(
                        color: container_box_shadow,
                        blurRadius: radius_size_10,
                        offset: Offset(radius_size_0, radius_size_10))
                  ]),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                width: MediaQuery.of(context).size.width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.title!,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            widget.subTitle!,
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.endTitle!, textAlign: TextAlign.right),
                        ],
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
