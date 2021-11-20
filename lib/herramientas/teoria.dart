import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Teoria extends StatelessWidget {
  const Teoria({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95.h,
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
                child: FadeIn(
                    delay: const Duration(milliseconds: 300),
                    duration: const Duration(seconds: 2),
                    child: Container(
                      padding: EdgeInsets.only(left: 3.w, top: 3.h),
                      child: Image.asset(
                        "images/newton.jpg",
                      ),
                    )),
              ),
              SizedBox(
                height: 3.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Text(
                  "MÉTODO",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 5.h,
                      fontFamily: "MontserratExtraBold",
                      color: Colors.black),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Text(
                  "NEWTON RAPHSON",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 8.h,
                      fontFamily: "MontserratExtraBold",
                      color: Colors.black),
                ),
              )
            ],
          )),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  child: Text(
                    "TRABAJO FINAL",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 6.h,
                        fontFamily: "MontserratExtraBold",
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Text(
                    "Presentación en forma de programa de alguno de los método numérico estudiado durante la materia",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 3.h,
                        fontFamily: "MontserratMediumItalic",
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Text(
                    "INTEGRANTES : ",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 4.h,
                        fontFamily: "MontserratExtraBold",
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Text(
                    "Ayelen Yanina Delgadillo Suyo                            S8182-2",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 3.h,
                        fontFamily: "MontserratMedium",
                        color: Colors.black),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Text(
                    "Tatiana Hoyos Velasquez                                      S8151-5",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 3.h,
                        fontFamily: "MontserratMedium",
                        color: Colors.black),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Text(
                    "Ivanna Sinforosa Piscopo Landivar                    S8096-9",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 3.h,
                        fontFamily: "MontserratMedium",
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Text(
                    "DOCENTE : ",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 4.h,
                        fontFamily: "MontserratExtraBold",
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Text(
                    "Ing Lili Jimenez Veizaga",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 3.h,
                        fontFamily: "MontserratMedium",
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Text(
                    "GESTIÓN : ",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 4.h,
                        fontFamily: "MontserratExtraBold",
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Text(
                    "2021 - II",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 3.h,
                        fontFamily: "MontserratMedium",
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
