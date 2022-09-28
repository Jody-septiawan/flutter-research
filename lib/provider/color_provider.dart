import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorProvider with ChangeNotifier {
  bool _isLigthBlue = false;

  bool get isLightBlue => _isLigthBlue;

  set isLightBlue(bool value) {
    _isLigthBlue = value;
    notifyListeners();
  }

  Color get color => (_isLigthBlue) ? Colors.yellow : Colors.green;
}
