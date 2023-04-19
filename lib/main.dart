import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movierating/screen/details/view/detail_screen.dart';
import 'package:movierating/screen/home/view/home_screen.dart';
import 'package:movierating/screen/search/view/search_screen.dart';
import 'package:movierating/screen/splash/splash_screen.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(p0) => SplashScreen(),
        'home':(p0) => HomeView(),
        'detail':(p0) => DetailScreen(),
        'search':(p0) => SearchScreen(),
      },
    ),
  );
}
