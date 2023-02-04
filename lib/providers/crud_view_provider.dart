// ignore_for_file: prefer_final_fields, use_build_context_synchronously

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_introduction_app_ard_grup/models/http_response.model.dart';
import 'package:flutter_introduction_app_ard_grup/models/user.model.dart';
import 'package:flutter_introduction_app_ard_grup/widgets/customAlertDialog.dart';
import 'package:intl/intl.dart';

import '../api/api_repository.dart';

class CrudViewProvider extends ChangeNotifier {
  final apirepository = APIRepository();

  GlobalKey<FormState> _crudFormKey = GlobalKey<FormState>();

  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _descriptionDateController = TextEditingController();
  TextEditingController _descriptionReadedController = TextEditingController();
  bool _iskurumTuruEmpty = false;

  bool get iskurumTuruEmpty => _iskurumTuruEmpty;

  TextEditingController get descriptionController => _descriptionController;

  GlobalKey<FormState> get crudFormKey => _crudFormKey;

  set setIsKurumTuruEmpty(bool kurumTuru) {
    _iskurumTuruEmpty = kurumTuru;
    notifyListeners();
  }

  set setdescriptionController(String descriptionController) {
    _descriptionController.text = descriptionController;
    notifyListeners();
  }

  TextEditingController get descriptionDateController =>
      _descriptionDateController;

  set setdescriptionDateController(String descriptionDateController) {
    _descriptionDateController.text = descriptionDateController;
    notifyListeners();
  }

  TextEditingController get descriptionReadedController =>
      _descriptionReadedController;

  set setdescriptionReadedController(String descriptionReadedController) {
    _descriptionReadedController.text = descriptionReadedController;
    notifyListeners();
  }

  clearForm() {
    _descriptionController.clear();
    _descriptionDateController.clear();
    _descriptionReadedController.clear();
    _iskurumTuruEmpty = false;
  }

  addForm(BuildContext context) async {
    if (_crudFormKey.currentState!.validate() && !iskurumTuruEmpty) {
      DateTime date = DateFormat("dd/MM/yyyy - HH:mm")
          .parse(_descriptionDateController.text);
      var utc = date.toIso8601String();

      Map<String, dynamic> queryParameters = {
        "id": 0,
        "customerId": 1,
        "description": _descriptionController.text,
        "notificationType": 1,
        "referenceId": "23123",
        "notificationDate": utc,
        "isRead": _descriptionReadedController.text == "Evet" ? true : false,
        "isDelete": false
      };

      httpSonucModel apiResponse = await apirepository.post(
          controller: "v1/Notification/AddNotification", data: queryParameters);
      if (apiResponse.success == true) {
        clearForm();
        CustomAlertDialogOnlyConfirm(
          context,
          () {
            Navigator.pop(context);
          },
          "Başarılı",
          "Kayıt başarı ile eklendi.",
          ArtSweetAlertType.success,
          "Tamam",
        );
      } else {
        CustomAlertDialogOnlyConfirm(context, () {
          Navigator.pop(context);
        },
            "Uyarı",
            "Kayıt sırasında bir hata oluştu. Hata mesajı: ${apiResponse.message}.",
            ArtSweetAlertType.warning,
            "Tamam");
      }
    } else {
      if (_descriptionReadedController.text.isEmpty) {
        _iskurumTuruEmpty = true;
      }

      notifyListeners();
    }
  }

  initForm() {
    _iskurumTuruEmpty = false;
  }
}
