//Uygulama içerisinde kullanılacak imajların merkezi olarak yönetilmesi için oluşturulmuştur.
//Buraya ekleme yapmadan önce pubspec.yaml dosyasına imajın yolu verilmesi gerekmektedir.
import 'package:flutter/material.dart';

enum APPImages {
  splashScreen,
}

extension APPImagesExtension on APPImages {
  String get images {
    switch (this) {
      case APPImages.splashScreen:
        return "lib/assets/images/ardgrup_logo.png";
    }
  }
}

enum APPColors { Main, Secondary, Accent, Graident }

extension APPColorsExtension on APPColors {
  Color get orange {
    switch (this) {
      case APPColors.Main:
        return Color.fromARGB(255, 23, 157, 224);
      case APPColors.Secondary:
        return const Color(0xffF9BA59);
      case APPColors.Accent:
        return const Color(0xffFFCC7E);
      default:
        return const Color(0xffF9AA33);
    }
  }

  Color get blue {
    switch (this) {
      case APPColors.Main:
        return Color.fromARGB(255, 48, 105, 211); //0xff1c5794
      default:
        return const Color(0xff4a6572);
    }
  }

  Color get grey {
    switch (this) {
      case APPColors.Main:
        return const Color(0xffABABAB);
      case APPColors.Secondary:
        return Color(0xFF776E6E);
      case APPColors.Accent:
        return Color.fromARGB(140, 255, 255, 255);
      default:
        return const Color(0xffABABAB);
    }
  }

  Color get black {
    switch (this) {
      case APPColors.Main:
        return const Color(0xff515151);
      case APPColors.Secondary:
        return const Color(0xFF242D31);
      default:
        return const Color(0xff515151);
    }
  }

  Color get white {
    switch (this) {
      case APPColors.Main:
        return const Color(0xffFFFDFD);
      default:
        return const Color(0xffFFFDFD);
    }
  }

  Color get red {
    switch (this) {
      case APPColors.Main:
        return Colors.redAccent;
      default:
        return Colors.red;
    }
  }
}
