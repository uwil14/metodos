import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'resultados.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'ecuacion.dart';

class MetodoNumerico extends StatefulWidget {
  const MetodoNumerico({Key? key}) : super(key: key);

  @override
  _MetodoNumericoState createState() => _MetodoNumericoState();
}

class _MetodoNumericoState extends State<MetodoNumerico> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95.h,
      width: 100.w,
      child: Column(
        children: const [Ecuacion(), Expanded(child: Resultados())],
      ),
    );
  }
}
