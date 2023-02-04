// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

import '../api/api_repository.dart';

class CrudViewProvider extends ChangeNotifier {
  final apirepository = APIRepository();

  GlobalKey<FormState> _crudFormKey = GlobalKey<FormState>();

  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _descriptionDateController = TextEditingController();
  TextEditingController _descriptionReadedController = TextEditingController();

  TextEditingController get descriptionController => _descriptionController;

  GlobalKey<FormState> get crudFormKey => _crudFormKey;

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
  }

  addForm() {
    if (_crudFormKey.currentState!.validate()) {
      print("validated");
      print(_descriptionController.text);
      print(_descriptionDateController.text);
      print(_descriptionReadedController.text);
    } else {
      print("not validated");
    }
  }
}
