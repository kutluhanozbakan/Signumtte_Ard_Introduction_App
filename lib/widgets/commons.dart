import 'package:flutter/material.dart';
import '../utils/utils.dart';

//Boşluk bırakmak için kullanılacak olan widget
// [...] => opsiyonel kullanım
Widget spaceArea(double? height, [double? width]) {
  return SizedBox(
    height: height,
    width: width,
  );
}

//Divider
Widget customDivider(double? padding, [Color? color]) {
  return Padding(
    padding: EdgeInsets.all(padding ?? 13.0),
    child: Divider(
      thickness: 0.7,
      indent: 80,
      endIndent: 80,
      color: color ?? mainGreyColor,
    ),
  );
}
