// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_introduction_app_ard_grup/utils/themes.dart';
import 'package:flutter_introduction_app_ard_grup/utils/utils.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String name;
  final Color? colors;
  final IconData? icons;
  final bool disable;
  final Color? textColor;
  final bool isIcon;
  final double width;
  final double height;
  CustomButton({
    Key? key,
    this.height = height_16,
    this.width = height_1,
    this.onTap,
    this.isIcon = false,
    this.name = "İsim",
    this.textColor,
    this.colors,
    this.icons,
    this.disable = false,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        // ignore: sort_child_properties_last
        child: SizedBox(
          height: MediaQuery.of(context).size.height / height,
          width: MediaQuery.of(context).size.width / width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isIcon
                  ? Icon(
                      icons,
                      color: disable == true
                          ? APPColors.Main.white
                          : textColor ?? APPColors.Main.white,
                    )
                  : Container(),
              Text(
                name,
                style: TextStyle(
                    color: disable == true
                        ? APPColors.Main.white
                        : textColor ?? APPColors.Main.white),
              ),
            ],
          ),
        ),
        onPressed: disable ? () {} : onTap,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius_size_10)),
          ),
          backgroundColor: disable
              ? MaterialStateProperty.all(Colors.grey)
              : MaterialStateProperty.all(colors ?? APPColors.Main.blue),
        ));
  }
}
