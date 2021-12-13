import 'package:flutter/material.dart';

class FormViewModel extends ChangeNotifier {
  String labelName = "";
  String weight = "0";

  changeForm(String labelValue, String weightValue) {
    labelName = labelValue;
    weight = weightValue;
    notifyListeners();
  }
}
