import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metodos_numericos/herramientas/app_bar.dart';
import 'package:metodos_numericos/herramientas/metodo_numerico.dart';
import 'package:metodos_numericos/herramientas/teoria.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      ListView(
        children:  const [
          AppBarEmi(),
          Teoria(),
          MetodoNumerico()

        ],
      ),
    );
  }
}
