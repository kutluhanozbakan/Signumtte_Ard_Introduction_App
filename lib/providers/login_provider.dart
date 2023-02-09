// ignore_for_file: prefer_final_fields, use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_introduction_app_ard_grup/components/list_view/list_view.dart';
import 'package:flutter_introduction_app_ard_grup/components/main_page_view/main_page_view.dart';
import 'package:flutter_introduction_app_ard_grup/models/user.model.dart';
import 'package:flutter_introduction_app_ard_grup/utils/global_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/api_repository.dart';

class RegistrationProvider extends ChangeNotifier {
  final apirepository = APIRepository();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool? _rememberMe = false;
  bool? _passwordVisible = false;
  bool? _changeLanguage = false;

  bool get changeLanguage => _changeLanguage!;
  bool get rememberMe => _rememberMe!;
  bool get passwordVisible => _passwordVisible!;
  TextEditingController get userName => _emailController;
  TextEditingController get password => _passwordController;

  set setLanguage(bool setLanguage) {
    _changeLanguage = setLanguage;
    notifyListeners();
  }

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

  set setPasswordVisible(bool passwordVisible) {
    _passwordVisible = passwordVisible;
    notifyListeners();
  }

  userLogin(String userName, String password, BuildContext context,
      bool rememberMe) async {
    UserResult apiresult = await apirepository.login(
        userName: userName, password: password, rememberMe: rememberMe);
    if (apiresult.success!) {
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => const MainPage())));
    } else {
      baglantiHatasi(context, "Kullanıcı girişi başarısız");
    }
  }

  changeLanguageOfApplication(bool val, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _changeLanguage = val;
    if (val) {
      prefs.setString("lang", "en");
      context.setLocale(const Locale('en'));
    } else {
      prefs.setString("lang", "tr");
      context.setLocale(const Locale('tr'));
    }
    notifyListeners();
  }

  initData() async {
    //Login ilk açıldığında local storage üzerinde bulunan dil tercihi çekilerek, sayfa üzerinde bulunan switch butonu değiştirilir.
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var lang = prefs.getString("lang");
    if (lang == "en" && lang != null) {
      _changeLanguage = true;
    } else {
      _changeLanguage = false;
      prefs.setString("lang", "tr");
    }
    notifyListeners();
  }
}
