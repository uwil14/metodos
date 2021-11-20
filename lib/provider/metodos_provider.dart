import 'package:flutter/cupertino.dart';

class MetodosProvider with ChangeNotifier {
  List<int> _ecuacion = List.generate(11, (index) => 0);

  List<int> get ecuacion {
    return _ecuacion;
  }

  set ecuacion(List<int> valor) {
    _ecuacion = valor;
    notifyListeners();
  }

  int _exponente = 0;

  int get exponente {
    return _exponente;
  }

  set exponente(int valor) {
    _exponente = valor;
    notifyListeners();
  }

  double _inicial = 1;

  double get inicial {
    return _inicial;
  }

  set inicial(double valor) {
    _inicial = valor;
    notifyListeners();
  }

  double _error = 0.5;

  double get error {
    return _error;
  }

  set error(double valor) {
    _error = valor;
    notifyListeners();
  }


  List <Iteracion> _resultado = [];

  List <Iteracion> get resultado {
    return _resultado;
  }

  set resultado( List <Iteracion> valor) {
    _resultado = valor;
    notifyListeners();
  }


}


class Iteracion {
  Iteracion(
      this.iteracion, this.inicial, this.fx, this.fprimax, this.vfinal,this.error,this.errorp);

  final String iteracion;
  final String inicial;
  final String fx;
  final String fprimax;
  final String vfinal;
  final String error;
  final String errorp;
}