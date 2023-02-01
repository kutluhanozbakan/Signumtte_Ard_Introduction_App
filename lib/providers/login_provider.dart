// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_introduction_app_ard_grup/components/list_view/list_view.dart';
import 'package:flutter_introduction_app_ard_grup/models/user.model.dart';

import '../api/api_repository.dart';

class RegistrationProvider extends ChangeNotifier {
  final apirepository = APIRepository();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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

  userLogin(
    String userName,
    String password,
    BuildContext context,
  ) async {
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => const ListScreen())));
    //Servis gelince açılacak TODO
    // UserResult apiresult = await apirepository.login(
    //     userName: userName, password: password, rememberMe: false);
    // if (apiresult.success!) {
    //   // ignore: use_build_context_synchronously
    //   Navigator.push(context,
    //       MaterialPageRoute(builder: ((context) => const ListScreen())));

    //   // Navigator.push(context,
    //   //     MaterialPageRoute(builder: ((context) => const Anasayfa())));
    // } else {
    //   print("Hata");
    // }
  }
}
