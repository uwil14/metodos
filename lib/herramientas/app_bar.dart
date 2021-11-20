import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppBarEmi extends StatelessWidget {
  const AppBarEmi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xff005F92), Color(0xff1C3B70)],
              stops: [0.1, 0.8],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter)),
      height: 15.h,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(1.w),
            child: FadeInLeft(
              child: Image.asset(
                "images/logo.png",
              ),
            ),
          ),
          Expanded(
              child: FadeInDown(
            child: Container(
              margin: EdgeInsets.all(1.w),
              child: Text(
                "Métodos Numéricos",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 6.h,
                    fontFamily: "MontserratExtraBold",
                    color: Colors.white),
              ),
            ),
          )),
          FadeInRight(
              child: Container(
            padding: EdgeInsets.all(1.w),
            child: Image.asset(
              "images/emi.png",
            ),
          ))
        ],
      ),
    );
  }
}
