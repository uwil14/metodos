import 'dart:math';
import 'package:metodos_numericos/provider/metodos_provider.dart';
import 'package:provider/provider.dart';

  // Metodo que se llama cuando se oprime el Boton "Calcular"
void NewtonRaphson(context) {
  //Esta es una variable del lenguaje para obtener los datos ingresados
  final datosProvider = Provider.of<MetodosProvider>(context, listen: false);
  //Se declara una variable llamada x y se le asigna de manera inicia el dato de Valor inicial
  double x = datosProvider.inicial;
  //Se declara una variable llamada "error" con un valor inicial cualquiera , inicialente se le va a asignar un 100
  double error = 100;
  //Se declara un variable llamada calcular y se llama a la funcion "Calcular" y se le manda el valor de x para que lo calcule segun la funcion que se haya ingresado
  double calcular = double.parse(Calcular(context, x));
  // Se crear una Iteracion y se coloca los datos iniciales
  Iteracion primeraIteracion = Iteracion(0.toString(), x.toString(),
      Evaluar(context, x), Derivar(context, x), calcular.toString(), "", "");

  //Se agrega la iteracion a la lista de iteraciones que despues seran mostradas en la tabla
  datosProvider.resultado.add(primeraIteracion);
  //A la variable X se le asigna el nuevo valor calculado
  x = double.parse(Calcular(context, x));
  //Se declara una variable de control para llevar la cuenta de las iteraciones
  int i = 1;
  //Se crea un bucle que se ejecutara hasta que el error relativo sea menor que el error permitido
  while (error > datosProvider.error) {
    //Se crean iteraciones y se calculan los valores de las funciones las derivadas y el error
    double calcular = double.parse(Calcular(context, x));
    error = (calcular.abs() - x.abs()).abs() / calcular.abs();
    Iteracion iteracion = Iteracion(
        i.toString(),
        x.toString(),
        Evaluar(context, x),
        Derivar(context, x),
        calcular.toString(),
        error.toStringAsFixed(5),
        (error * 100).toStringAsFixed(2) + "% ");
    //En cada iteracion se agrega a la lista que se mostrara en la tabla
    datosProvider.resultado.add(iteracion);
    //En cada iteracion se actualiza el valor de "x" y la variable de control aumenta
    x = double.parse(Calcular(context, x));
    i++;
  }
}
//La funcion "Evaluar" recibe el valor de "x" y lo calcula en F(x)
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
//La funcion "Derivar" recibe el valor de "x" y lo calcula en F'(x)
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
//La funcion "Calcular" recibe el valor de "x" y lo calcula con la formula de "x-(F(x)/F'(x))"
String Calcular(context, double valor) {
  double e = double.parse(Evaluar(context, valor));
  double d = double.parse(Derivar(context, valor));
  double f = valor - (e / d);
  return f.toStringAsFixed(5);
}

//Se creo una clase para generar la tabla de iteraciones
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