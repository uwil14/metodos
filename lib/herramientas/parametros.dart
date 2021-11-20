import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:metodos_numericos/provider/metodos_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Parametros extends StatefulWidget {
  final String title, descriptions, text;

  const Parametros(
      {required this.title, required this.descriptions, required this.text});

  @override
  _ParametrosState createState() => _ParametrosState();
}

class _ParametrosState extends State<Parametros> {
  static const double constantsPadding = 20;
  static const double constantsAvatarRadius = 45;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(constantsPadding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    final datosProvider = Provider.of<MetodosProvider>(context);
    final inicialController = TextEditingController();
    final errorController = TextEditingController();
    inicialController.text=datosProvider.inicial.toString();
    errorController.text=datosProvider.error.toString();
    final GlobalKey<FormState> formUserKey = GlobalKey<FormState>();

    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(
              left: constantsPadding,
              top: constantsAvatarRadius + constantsPadding,
              right: constantsPadding,
              bottom: constantsPadding),
          margin: EdgeInsets.only(
              top: constantsAvatarRadius, left: 25.w, right: 25.w),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(constantsPadding),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black45, spreadRadius: 1, blurRadius: 10),
              ]),
          child: ListView(
            shrinkWrap: true,
            children: [
              Text(
                widget.title,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.descriptions,
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              Form(
                key: formUserKey,
                child: ListView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  shrinkWrap: true,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 5.w, right: 5.w, top: 3.h),
                      child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: inicialController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Inicial',
                              hintText: 'Ingrese Valor Inicial'),
                          validator: MultiValidator([
                            RequiredValidator(errorText: "* Requerido"),
                          ])
                          //validatePassword,        //Function to check validation
                          ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 5.w, right: 5.w, top: 3.h, bottom: 3.h),
                      child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: errorController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Error',
                              hintText: 'Ingrese Error Aceptado'),
                          validator: MultiValidator([
                            RequiredValidator(errorText: "* Requerido"),
                          ])
                          //validatePassword,        //Function to check validation
                          ),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            left: 5.w, right: 5.w, top: 1.h, bottom: 3.h),
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                                    margin: EdgeInsets.only(right: 1.h),
                                    height: 6.h,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              side: const BorderSide(
                                                  color: Colors.black)),

                                          primary: Colors.black, // background
                                          onPrimary: Colors.white,
                                        ),
                                        child: const Text(
                                          "Volver",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: "MontserratSemiBold",
                                            color: Colors.white,
                                          ),
                                        )))),
                            Expanded(
                                child: Container(
                              margin: EdgeInsets.only(left: 1.h),
                              height: 6.h,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (formUserKey.currentState!.validate()) {
                                      datosProvider.inicial =
                                          double.parse(inicialController.text);
                                      datosProvider.error =
                                          double.parse(errorController.text);
                                      Navigator.pop(context);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        side: const BorderSide(
                                            color: Colors.blue)),

                                    primary: Colors.blue,
                                    // background
                                    onPrimary: Colors.white,
                                  ),
                                  child: Text(
                                    widget.text,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontFamily: "MontserratSemiBold",
                                      color: Colors.white,
                                    ),
                                  )),
                            ))
                          ],
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: constantsPadding,
          right: constantsPadding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: constantsAvatarRadius,
            child: ClipRRect(
                borderRadius: const BorderRadius.all(
                    Radius.circular(constantsAvatarRadius)),
                child: Image.asset("images/castillo.png")),
          ),
        ),
      ],
    );
  }
}
