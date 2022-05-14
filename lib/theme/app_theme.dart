import 'package:flutter/material.dart';

class AppTheme {

  static Color primary = Colors.indigo;
  static Color colorCard = const Color.fromARGB(255, 60,60,77);
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    // Color Primario
    primaryColor: primary,
    //TextButton Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom( primary: primary )
    ),
    
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: TextStyle( color: primary ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: primary
        ),
        borderRadius: const BorderRadius.only( 
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10)
         )
      ),

      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: primary
        ),
        borderRadius: const BorderRadius.only( 
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10)
        )
      ),

      border: const OutlineInputBorder(
        borderRadius: BorderRadius.only( 
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10)
        )
      )
    )
  );

    static final ThemeData darkTheme = ThemeData.dark().copyWith(
    // Color Primario
    primaryColor: Colors.indigo,
    //AppBar Theme
    appBarTheme: AppBarTheme(
      color: primary,
      elevation: 0
    ),
    scaffoldBackgroundColor: Colors.black
  );
}