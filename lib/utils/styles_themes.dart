import 'package:flutter/material.dart';
import 'font_themes.dart';

TextStyle _getAppTextStyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight);
}

//varsayılan text style
TextStyle getRegularTextStyle(
    {double fontSize = FontSizeManager.s12, required Color color}) {
  return _getAppTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.regular, color);
}

//light text style
TextStyle getLightTextStyle(
    {double fontSize = FontSizeManager.s12, required Color color}) {
  return _getAppTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.light, color);
}

//bold text style
TextStyle getBoldTextStyle({
  double fontSize = FontSizeManager.s12,
  required Color color,
}) {
  return _getAppTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.bold, color);
}

//Semi-bold text style
TextStyle getSemiBoldTextStyle(
    {double fontSize = FontSizeManager.s12, required Color color}) {
  return _getAppTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.semiBold, color);
}

//Medium text style
TextStyle getMediumTextStyle(
    {double fontSize = FontSizeManager.s12, required Color color}) {
  return _getAppTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.medium, color);
}
