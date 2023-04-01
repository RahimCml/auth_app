import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  bool emailRegex = true;

  void checkEmail(v) {
    if (v) {
      emailRegex = true;
    } else {
      emailRegex = false;
    }
    notifyListeners();
  }
}
