import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:metodos_numericos/herramientas/newton_raphson.dart';
import 'package:metodos_numericos/herramientas/parametros.dart';
import 'package:metodos_numericos/herramientas/resultados.dart';
import 'package:metodos_numericos/provider/metodos_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Ecuacion extends StatefulWidget {
  const Ecuacion({Key? key}) : super(key: key);

  @override
  _EcuacionState createState() => _EcuacionState();
}

class _EcuacionState extends State<Ecuacion> {
  @override
  Widget build(BuildContext context) {
    final datosProvider = Provider.of<MetodosProvider>(context);
    final coeficienteController = TextEditingController();
    final GlobalKey<FormState> coeficienteForm = GlobalKey<FormState>();
    List<Widget> ecuacion() {
      int i = 0;
      List<Widget> l = [];
      for (var element in datosProvider.ecuacion) {
        l.add(element != 0
            ? SizedBox(
                child: Row(
                children: [
                  Center(
                    child: Text(element < 0 ? "-   " : "+   ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 5.h,
                            fontFamily: "MontserratRegular",
                            color: Colors.red)),
                  ),
                  SizedBox(
                      child: Row(
                    children: [
                      SizedBox(
                          child: Text(
                        element > 0
                            ? element.toString()
                            : element.toString().substring(1),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 6.h,
                            fontFamily: "MontserratRegular",
                            color: Colors.black),
                      )),
                      i != 0
                          ? SizedBox(
                              child: Text(
                              "x",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 6.h,
                                  fontFamily: "MontserratMediumItalic",
                                  color: Colors.blue),
                            ))
                          : Container(),
                      i > 1
                          ? SizedBox(
                              height: 10.h,
                              child: Text(
                                i.toString(),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 4.h,
                                    fontFamily: "MontserratRegular",
                                    color: Colors.black),
                              ))
                          : Container(),
                    ],
                  ))
                ],
              ))
            : Container());
        i++;
      }
      return l;
    }

    return SizedBox(
      height: 30.h,
      child: Row(
        children: [
          Expanded(
              child: Container(
            margin: EdgeInsets.symmetric(horizontal: 2.w),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
                  child: Text(
                    "DATOS",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 3.h,
                        fontFamily: "MontserratExtraBold",
                        color: Colors.black),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 1.w),
                      child: const Text("Selecciones un EXPONENTE"),
                    )),
                    Expanded(
                        child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            value: datosProvider.exponente,
                            isExpanded: true,
                            onChanged: (value) {
                              setState(() {
                                datosProvider.exponente =
                                    int.parse(value.toString());
                              });
                            },
                            items: List.generate(
                                11,
                                (index) => DropdownMenuItem(
                                      value: index,
                                      child: Text(
                                        (index).toString(),
                                      ),
                                    ))))
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                Form(
                    key: coeficienteForm,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.only(right: 1.w),
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: coeficienteController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Coeficiente',
                                  hintText: 'Ingrese el Coeficiente'),
                              validator: MultiValidator([
                                RequiredValidator(errorText: "* Requerido"),
                              ])
                              //validatePassword,        //Function to check validation
                              ),
                        )),
                        Expanded(
                            child: SizedBox(
                          height: 5.h,
                          child: ElevatedButton(
                              onPressed: () {
                                if (coeficienteForm.currentState!.validate()) {
                                  setState(() {
                                    datosProvider
                                            .ecuacion[datosProvider.exponente] =
                                        int.parse(coeficienteController.text);
                                  });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: const BorderSide(
                                        color: Color(0xff2C3095))),

                                primary: const Color(0xff2C3095),
                                // background
                                onPrimary: Colors.white,
                              ),
                              child: const Text(
                                "Guardar",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "MontserratSemiBold",
                                  color: Colors.white,
                                ),
                              )),
                        ))
                      ],
                    ))
              ],
            ),
          )),
          SizedBox(
            height: 30.h,
            width: 50.w,
            child: Center(
                child: ListView(
                  shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              children: ecuacion(),
            )),
          ),
          Expanded(
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 2.h),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: 20.w,
                    padding: EdgeInsets.symmetric(vertical: 0.5.h),
                    child: ElevatedButton(
                        onPressed: () {

                          setState(() {
                            datosProvider.ecuacion=List.generate(11, (index) => 0);
                            datosProvider.resultado=[];
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: const BorderSide(color: Colors.black)),

                          primary: Colors.black,
                          // background
                          onPrimary: Colors.white,
                        ),
                        child: const Text(
                          "Limpiar",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "MontserratSemiBold",
                            color: Colors.white,
                          ),
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 20.w,
                    padding: EdgeInsets.symmetric(vertical: 0.5.h),
                    child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const Parametros(
                                    title: "Ingrese los Parametros",
                                    descriptions: "Escriba los datos requeridos",
                                    text: "Guardar");
                              });
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: const BorderSide(color: Colors.blue)),

                          primary: Colors.blue,
                          // background
                          onPrimary: Colors.white,
                        ),
                        child: const Text(
                          "Agregar Parametros",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "MontserratSemiBold",
                            color: Colors.white,
                          ),
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 20.w,
                    padding: EdgeInsets.symmetric(vertical: 0.5.h),
                    child: ElevatedButton(
                        onPressed: () {
                         setState(() {
                           datosProvider.resultado=[];
                           NewtonRaphson(context);
                         });
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: const BorderSide(color: Colors.green)),

                          primary: Colors.green,
                          // background
                          onPrimary: Colors.white,
                        ),
                        child: const Text(
                          "Calcular",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "MontserratSemiBold",
                            color: Colors.white,
                          ),
                        )),
                  ),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
