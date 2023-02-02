// ignore_for_file: prefer_final_fields, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_introduction_app_ard_grup/components/list_view/list_view.dart';
import 'package:flutter_introduction_app_ard_grup/models/user.model.dart';
import 'package:flutter_introduction_app_ard_grup/utils/global_utils.dart';

import '../api/api_repository.dart';

class RegistrationProvider extends ChangeNotifier {
  final apirepository = APIRepository();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool? _rememberMe = false;

  bool get rememberMe => _rememberMe!;
  TextEditingController get userName => _emailController;
  TextEditingController get password => _passwordController;

  set setUserName(String userName) {
    _emailController.text = userName;
    notifyListeners();
  }

  set setPassword(String password) {
    _passwordController.text = password;
    notifyListeners();
  }

  set setRememberMe(bool remember) {
    _rememberMe = remember;
    notifyListeners();
  }

  userLogin(String userName, String password, BuildContext context,
      bool rememberMe) async {
    UserResult apiresult = await apirepository.login(
        userName: userName, password: password, rememberMe: rememberMe);
    if (apiresult.success!) {
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => const ListScreen())));
    } else {
      baglantiHatasi(context, "Kullanıcı girişi başarısız");
    }
  }
}
