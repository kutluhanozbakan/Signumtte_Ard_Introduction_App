import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class CustomListWithAvatar extends StatelessWidget {
  final Color? iconColor;
  final IconData? icon;
  final String? title, subTitle, extraTitle, iconText;
  final GestureTapCallback? onTap;
  final int? extraTitleHeight;
  CustomListWithAvatar({
    Key? key,
    this.iconColor,
    this.title,
    this.subTitle,
    this.extraTitle,
    this.iconText,
    this.onTap,
    this.icon,
    this.extraTitleHeight = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 9.5,
      decoration: BoxDecoration(
          color: mainWhiteColor,
          borderRadius: BorderRadius.circular(radius_size_10),
          boxShadow: [
            BoxShadow(
                color: container_box_shadow,
                blurRadius: radius_size_10,
                offset: Offset(radius_size_0, radius_size_10))
          ]),
      child: Material(
        color: Colors.transparent,
        child: ListTile(
          title: Text(
            title!,
          ),
          subtitle: Stack(
            fit: StackFit.loose,
            children: [
              Text(subTitle!),
              Padding(
                padding: EdgeInsets.only(
                    top:
                        MediaQuery.of(context).size.height / extraTitleHeight!),
                child: Text(
                  extraTitle!,
                  style: TextStyle(fontSize: 13),
                ),
              )
            ],
          ),
          trailing: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 40,
                    right: MediaQuery.of(context).size.width / 40),
                child: Icon(icon),
              ),
            ],
          ),
          leading: CircleAvatar(
            radius: 25,
            child: Text(
              iconText!,
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: iconColor,
          ),
          enabled: true,
          onTap: onTap,
        ),
      ),
    );
  }
}
