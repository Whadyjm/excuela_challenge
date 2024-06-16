///
/// GESTOR DE ESTADO CON PROVIDER
///

import 'package:flutter/cupertino.dart';

class ProgressProvider with ChangeNotifier {

  double _puntos = 0; /// Se declara la variable cuyo estado deseamos gestionar
  double get puntos => _puntos;

  /// Este metodo permite incrementar el valor de la variable cada vez que sea llamado
  void incrementPuntos() {
    _puntos = (_puntos + (1/3));
    notifyListeners(); /// ---> Notifica a las clases que se ha generado un cambio en la variable
  }

  /// Este metodo permite reiniciar el valor de la variable, en este caso lo declaramos en cero
  void reinicioPuntos() {
    _puntos = 0;
    notifyListeners(); /// ---> Notifica a las clases que se ha generado un cambio en la variable
  }
}