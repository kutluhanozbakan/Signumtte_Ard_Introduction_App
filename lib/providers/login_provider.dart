import 'package:flutter/material.dart';

class RegistrationProvider extends ChangeNotifier {
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
    //TODO SERVİS YAZILACAK
    print(userName);
  }
}
