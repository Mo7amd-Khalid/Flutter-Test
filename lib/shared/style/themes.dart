import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: Colors.deepOrange,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 22.0,
          color: Colors.black
      ),
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 32,
          color: Colors.black,
          fontWeight: FontWeight.bold

        ),
      displayMedium: TextStyle(
            fontSize: 26,
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),
      displaySmall: TextStyle(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),
      bodyLarge: TextStyle(
          fontSize: 18
      ),
      bodyMedium: TextStyle(
          fontSize: 16
        ),
      bodySmall: TextStyle(
            fontSize: 14,
          color: Colors.grey
        ),
    )
);

ThemeData darkMode = ThemeData(
    primarySwatch: Colors.deepOrange,
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 22.0
      ),
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.black
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 32,
          color: Colors.black,
          fontWeight: FontWeight.bold

      ),
      displayMedium: TextStyle(
          fontSize: 26,
          color: Colors.black,
          fontWeight: FontWeight.bold
      ),
      displaySmall: TextStyle(
          fontSize: 22,
          color: Colors.black,
          fontWeight: FontWeight.bold
      ),
      bodyLarge: TextStyle(
          fontSize: 18
      ),
      bodyMedium: TextStyle(
          fontSize: 16
      ),
      bodySmall: TextStyle(
          fontSize: 14,
          color: Colors.grey
      ),
    )
);