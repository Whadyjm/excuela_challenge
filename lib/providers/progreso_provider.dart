import 'package:flutter/cupertino.dart';

class ProgressProvider with ChangeNotifier {

  double _puntos = 0;
  double get puntos => _puntos;

  void incrementPuntos() {
    _puntos = (_puntos + (1/3));
    notifyListeners();
  }
}