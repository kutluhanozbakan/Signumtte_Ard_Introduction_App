// ignore_for_file: prefer__ructors

import 'package:flutter/material.dart';
import 'package:flutter_introduction_app_ard_grup/utils/themes.dart';

import '../utils/styles_themes.dart';
import '../utils/utils.dart';
import 'buttonWidgets/customIconButtonSmall.dart';

class AppListTile extends StatefulWidget {
  final IconData? icon;
  final String baslik;
  final String icerik;
  AppListTile(
      {Key? key, this.icon, this.baslik = "Başlık", this.icerik = "İçerik"})
      : super(key: key);

  @override
  State<AppListTile> createState() => _AppListTileState();
}

class _AppListTileState extends State<AppListTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        leading: Icon(widget.icon ?? Icons.account_circle_rounded),
        title: Text(widget.baslik),
        trailing: Container(
          width: 100,
          child: Text(
            widget.icerik,
            maxLines: 3,
          ),
        ),
      ),
    );
  }
}

class AppListTileHeader extends StatefulWidget {
  final String baslik;
  final List<Widget> icerik;
  final VoidCallback onPressed;
  final bool isButton;
  final IconData icon;
  final Color? buttonColor;

  AppListTileHeader({
    Key? key,
    required this.icerik,
    this.baslik = "kart başlığı giriniz",
    required this.onPressed,
    this.isButton = false,
    this.buttonColor,
    this.icon = Icons.add_rounded,
  }) : super(key: key);

  @override
  State<AppListTileHeader> createState() => _AppListTileHeaderState();
}

class _AppListTileHeaderState extends State<AppListTileHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: double.infinity),
      color: APPColors.Accent.grey,
      child: Column(children: [
        Padding(
          padding: EdgeInsets.all(7.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                  margin: EdgeInsets.only(top: 2, left: 1),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 200,
                        bottom: MediaQuery.of(context).size.height / 200,
                        left: MediaQuery.of(context).size.width / 30,
                        right: MediaQuery.of(context).size.width / 30),
                    child: Text(
                      widget.baslik,
                      style: getSemiBoldTextStyle(color: Colors.white),
                    ),
                  )),
              widget.isButton
                  ? CustumIconButtonSm(
                      onPressed: widget.onPressed,
                      icon: widget.icon,
                      backgroundColor:
                          widget.buttonColor ?? APPColors.Main.blue,
                    )
                  : Container()
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(children: widget.icerik),
        ),
      ]),
    );
  }
}

class AppListTileWithAvatar extends StatelessWidget {
  final Color? iconColor;
  final IconData? icon;
  final String? title, subTitle, extraTitle, iconText;
  final GestureTapCallback? onTap;
  final int? extraTitleHeight;
  AppListTileWithAvatar({
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
