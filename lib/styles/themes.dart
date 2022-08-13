import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var defaultColor = Colors.blueAccent;
ThemeData darkTheme = ThemeData(
  textTheme: const TextTheme(bodyMedium: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 16)),
  scaffoldBackgroundColor: const Color(0x30303000),
  appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.blueAccent),
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold, color: Colors.blueAccent,
        fontSize: 20.0,),
      backgroundColor: Color(0x21212100),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarBrightness: Brightness.light
      )
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      selectedItemColor: Colors.deepOrange,
      elevation: 30.0,
      unselectedItemColor: Colors.grey
  ),

);

ThemeData lightTheme = ThemeData(
  textTheme: const TextTheme(bodyMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 16)),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme:  AppBarTheme(
    titleTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
        color: Colors.black
    ),
    color: Colors.white,
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: defaultColor,
      statusBarIconBrightness: Brightness.light,
    ),
    iconTheme: const IconThemeData(color: Colors.black),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepOrange,
      elevation: 30
  ),
);