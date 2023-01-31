import 'package:flutter/material.dart';

//Boşluk bırakmak için kullanılacak olan widget
// [...] => opsiyonel kullanım
Widget spaceArea(double? height, [double? width]) {
  return SizedBox(
    height: height,
    width: width,
  );
}
