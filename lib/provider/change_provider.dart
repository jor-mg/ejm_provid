import 'package:flutter/material.dart';

class ChangeProvider with ChangeNotifier {
  bool dato = false;
  bool dato1 = false;
  bool dato2 = false;

  bool isEmpty = false;

  bool get isChange => dato;

  cambiar(bool value) {
    dato = value;
    print(value);
    notifyListeners();
  }

  cambiar1(bool value) {
    dato1 = value;
    print(value);
    notifyListeners();
  }

  cambiar2(bool value) {
    dato2 = value;
    print(value);
    notifyListeners();
  }

  btnCambiar() {
    (dato1 == false) ? (dato1 = true) : (dato1 = false);
    notifyListeners();
    //(dato1 == false) ? dato1 = true : dato1 = false;
  }

  btnMostrarAlerta() {
    (dato == false && dato1 == false && dato2 == false)
        ? (isEmpty = true)
        : (isEmpty = false);

    notifyListeners();
  }
}
