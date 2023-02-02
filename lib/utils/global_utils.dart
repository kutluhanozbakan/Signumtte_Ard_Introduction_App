// ignore_for_file: use_build_context_synchronously

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_introduction_app_ard_grup/components/login/login.dart';
import '../widgets/customAlertDialog.dart';
import '../widgets/customDialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future logout(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) => CustomDialog(
            cancelFunction: () {
              Navigator.pop(context);
            },
            confirmButtonText: "Evet",
            description: "Uygulamadan çıkış yapılacaktır onaylıyor musunuz?",
            okFunction: () async {
              prefs.clear();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                  (route) => false);
            },
            onlyConfirmation: false,
            cancelButtonText: "Hayır",
          ));
}

void baglantiHatasi(BuildContext context, String? message) async {
  CustomAlertDialogOnlyConfirm(context, () {
    Navigator.pop(context);
  }, "Bir hata meydana geldi.", message!, ArtSweetAlertType.danger, "Tamam");
}

//-----------------VALIDATORS-----------------------------
// ignore_for_file: body_might_complete_normally_nullable

String? formBos(String? fieldContent) {
  if (fieldContent == "" || fieldContent == null) {
    return 'Bu alan boş olamaz';
  } else {
    if (fieldContent.length < 3) {
      return 'Bu alan 3 karakterden az olamaz.';
    }
  }
}

String? formEmail(String? fieldContent) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(p);

  if (regExp.hasMatch(fieldContent!)) {
    return null;
  } else {
    return "Lütfen Email formatını kontrol ediniz.";
  }
}

String? formText(String? fieldContent) {
  if (fieldContent!.length < 3) {
    return "Bu alan 3 karakterden az olamaz";
  } else {
    return null;
  }
}

String? formDropdown(String? fieldContent) {
  if (fieldContent == null) {
    return "Lütfen bir seçim yapınız";
  } else {
    null;
  }
}

String? formPassword(String? fieldContent) {
  if (fieldContent!.isNotEmpty) {
    null;
  } else {
    return "Lütfen şifrenizi giriniz";
  }
}

String? formTC(String? fieldContent) {
  if (fieldContent!.isNotEmpty) {
    if (fieldContent.length < 11) {
      return "Lütfen 11 haneli TC nizi giriniz.";
    }
  } else {
    return "Bu alan boş olamaz";
  }
}

String? formTCLength(String? fieldContent) {
  if (fieldContent!.isNotEmpty) {
    if (fieldContent.length < 11) {
      return "Lütfen 11 haneli TC nizi giriniz.";
    }
  }
}

String? formPhone(String? fieldContent) {
  final p = RegExp(r'^^[1-9][0-9]*$');
  if (fieldContent!.isNotEmpty) {
    if (!p.hasMatch(fieldContent) || fieldContent.length < 10) {
      return "Lütfen telefon numarasını başında 0 olmadan giriniz";
    }
  } else {
    return "Bu alan boş olamaz";
  }
}

String? formPhoneWithHolder(String? fieldContent) {
  if (fieldContent!.isNotEmpty) {
    print(fieldContent[2]);
    if (fieldContent[2] == "0") {
      return "Lütfen telefon numarasını başında 0 olmadan giriniz";
    }
  } else {
    return "Bu alan boş olamaz";
  }
}

String? formLength(String? fieldContent) {
  if (fieldContent!.length < 3) {
    return "Bu alan 3 karakterden az olamaz";
  }
}
