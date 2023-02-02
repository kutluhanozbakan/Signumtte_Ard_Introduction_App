import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_introduction_app_ard_grup/utils/themes.dart';

CustomAlertDialog(
    BuildContext context,
    VoidCallback? onConfirm,
    String title,
    String text,
    ArtSweetAlertType type,
    String confirmButtonText,
    String denyButtonText) {
  return ArtSweetAlert.show(
      barrierDismissible: false,
      context: context,
      artDialogArgs: ArtDialogArgs(
          cancelButtonColor: APPColors.Main.red,
          confirmButtonColor: APPColors.Main.blue,
          type: type,
          title: title,
          text: text,
          confirmButtonText: confirmButtonText,
          denyButtonText: denyButtonText,
          onCancel: () {
            Navigator.pop(context);
          },
          onConfirm: onConfirm));
}

CustomAlertDialogOnlyConfirm(
  BuildContext context,
  VoidCallback? onConfirm,
  String title,
  String text,
  ArtSweetAlertType type,
  String confirmButtonText,
) {
  return ArtSweetAlert.show(
      barrierDismissible: false,
      context: context,
      artDialogArgs: ArtDialogArgs(
          cancelButtonColor: APPColors.Main.red,
          confirmButtonColor: APPColors.Main.blue,
          type: type,
          title: title,
          text: text,
          confirmButtonText: confirmButtonText,
          onConfirm: onConfirm));
}

SimpleShowDialog(
  BuildContext context,
  VoidCallback? onConfirm,
  String title,
  String text,
  bool success,
  String confirmButtonText,
) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: Column(
            children: [
              success
                  ? SuccessIcon(
                      size: MediaQuery.of(context).size.height / 9,
                    )
                  : WarningIcon(size: MediaQuery.of(context).size.height / 9),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(89, 89, 89, 1), fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(89, 89, 89, 1), fontSize: 15),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: onConfirm,
              child: Text(
                confirmButtonText,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ],
        ),
      );
    },
  );
}
