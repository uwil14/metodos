import 'dart:math';
import 'package:metodos_numericos/provider/metodos_provider.dart';
import 'package:provider/provider.dart';

void NewtonRaphson(context) {
  final datosProvider = Provider.of<MetodosProvider>(context, listen: false);

  double x = datosProvider.inicial;
  double error = 100;

  double calcular = double.parse(Calcular(context, x));

  Iteracion primeraIteracion = Iteracion(
      0.toString(),
      x.toString(),
      Evaluar(context, x),
      Derivar(context, x),
      calcular.toString(),
      "",
      "");
  datosProvider.resultado.add(primeraIteracion);
  x = double.parse(Calcular(context, x));

  int i = 1;
  while (error > datosProvider.error) {
    double calcular = double.parse(Calcular(context, x));
    error = (  calcular.abs() - x.abs() ).abs() / calcular.abs();
    Iteracion iteracion = Iteracion(
        i.toString(),
        x.toString(),
        Evaluar(context, x),
        Derivar(context, x),
        calcular.toString(),
        error.toStringAsFixed(5),
        (error * 100).toStringAsFixed(2) + "% ");
    datosProvider.resultado.add(iteracion);
    x = double.parse(Calcular(context, x));
    i++;
  }
}

String Evaluar(context, double valor) {
  final datosProvider = Provider.of<MetodosProvider>(context, listen: false);
  double e = 0.0;
  int i = 0;
  for (var element in datosProvider.ecuacion) {
    int coeficiente = int.parse(element.toString());
    num calculo = coeficiente * pow(valor, i);
    e = e + calculo;
    i++;
  }

  return e.toStringAsFixed(5);
}

String Derivar(context, double valor) {
  final datosProvider = Provider.of<MetodosProvider>(context, listen: false);
  double e = 0.0;
  int i = 0;
  for (var element in datosProvider.ecuacion) {
    if (i != 0) {
      int coeficiente = int.parse(element.toString()) * i;
      num calculo = coeficiente * pow(valor, i - 1);
      e = e + calculo;
    }

    i++;
  }

  return e.toStringAsFixed(5);
}

String Calcular(context, double valor) {
  double e = double.parse(Evaluar(context, valor));
  double d = double.parse(Derivar(context, valor));
  double f = valor - (e / d);
  return f.toStringAsFixed(5);
}
