import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  bool emailRegex = true;
  bool isSecure = true;

  void checkEmail(v) {
    if (v) {
      emailRegex = true;
    } else {
      emailRegex = false;
    }
    notifyListeners();
  }

  void showPassword() {
    print(isSecure);
    isSecure = !isSecure;
    notifyListeners();
  }
}
