import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:metodos_numericos/herramientas/home_page.dart';
import 'package:metodos_numericos/provider/metodos_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'herramientas/splash_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => MetodosProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: "Métodos Numéricos - EMI UASC",
        scrollBehavior: MyCustomScrollBehavior(),
        theme: ThemeData(
          fontFamily: 'MontserratRegular',
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      );
    });
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
