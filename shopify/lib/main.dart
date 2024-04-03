// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/Componet/splashscreen.dart';
import 'package:shopify/Screens/homescreen.dart';
import 'package:shopify/Screens/resultscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(430, 932),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
      ),
    );
  }
}
