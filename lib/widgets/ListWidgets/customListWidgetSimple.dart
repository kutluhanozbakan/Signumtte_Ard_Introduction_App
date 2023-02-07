// ignore_for_file: prefer__ructors

import 'package:flutter/material.dart';
import 'package:flutter_introduction_app_ard_grup/utils/themes.dart';

import '../../utils/styles_themes.dart';
import '../../utils/utils.dart';
import '../buttonWidgets/customIconButtonSmall.dart';

class CustomListWidgetSimple extends StatefulWidget {
  final IconData? icon;
  final String baslik;
  final String icerik;
  CustomListWidgetSimple(
      {Key? key, this.icon, this.baslik = "Başlık", this.icerik = "İçerik"})
      : super(key: key);

  @override
  State<CustomListWidgetSimple> createState() => _CustomListWidgetSimpleState();
}

class _CustomListWidgetSimpleState extends State<CustomListWidgetSimple> {
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
