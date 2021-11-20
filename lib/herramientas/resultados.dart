import 'package:flutter/material.dart';
import 'package:metodos_numericos/provider/metodos_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Resultados extends StatefulWidget {
  const Resultados({Key? key}) : super(key: key);

  @override
  _ResultadosState createState() => _ResultadosState();
}

class _ResultadosState extends State<Resultados> {
  @override
  Widget build(BuildContext context) {
    void Actualizar(){
      setState(() {
        print("Se actualizo");
      });
    }
    final datosProvider = Provider.of<MetodosProvider>(context);
    return Column(
      children: [
        SizedBox(
          height: 12.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 2.w,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Text(
                  "Valor Inicial : ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 4.h,
                      fontFamily: "MontserratExtraBold",
                      color: Colors.black),
                ),
              ),
              SizedBox(
                width: 1.w,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Text(
                  datosProvider.inicial.toString(),
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 4.h,
                      fontFamily: "MontserratMedium",
                      color: Colors.black),
                ),
              ),
              SizedBox(
                width
                    : 3.w,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Text(
                  "Error Aceptado : ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 4.h,
                      fontFamily: "MontserratExtraBold",
                      color: Colors.black),
                ),
              ),
              SizedBox(
                width: 1.w,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Text(
                  datosProvider.error.toString(),
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 4.h,
                      fontFamily: "MontserratMedium",
                      color: Colors.black),
                ),
              ),
              SizedBox(
                width: 3.w,
              ),
            ],
          ),
        ),
        Expanded(
            child: Container(
          padding: EdgeInsets.all(1.h),
          child: ListView(
            children: [
              DataTable(

                columns: const [
                  DataColumn(
                    label: Text(
                      'ITERACION',
                      style: TextStyle(
                        fontFamily: "MontserratSemiBold",
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'INICIAL',
                      style: TextStyle(
                        fontFamily: "MontserratSemiBold",
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'F(x)',
                      style: TextStyle(
                        fontFamily: "MontserratSemiBold",
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "F'(x)",
                      style: TextStyle(
                        fontFamily: "MontserratSemiBold",
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'FINAL',
                      style: TextStyle(
                        fontFamily: "MontserratSemiBold",
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'ERROR',
                      style: TextStyle(
                        fontFamily: "MontserratSemiBold",
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'ERROR %',
                      style: TextStyle(
                        fontFamily: "MontserratSemiBold",
                      ),
                    ),
                  ),
                ],
                rows: datosProvider.resultado
                    .map((e) => DataRow(
                          cells: [
                            DataCell(Text(e.iteracion)),
                            DataCell(Text(e.inicial)),
                            DataCell(Text(e.fx)),
                            DataCell(Text(e.fprimax)),
                            DataCell(Text(e.vfinal)),
                            DataCell(Text(e.error)),
                            DataCell(Text(e.errorp)),
                          ],
                        ))
                    .toList(),
              )
            ],
          ),
        )),

      ],
    );
  }
}
