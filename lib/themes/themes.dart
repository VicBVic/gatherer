import 'package:flutter/material.dart';

ColorScheme getMainColorScheme(){

  return ColorScheme(
      primary: Colors.grey.shade900,
      primaryVariant: Colors.grey.shade800,
      secondary: Colors.blue.shade900,
      secondaryVariant: Colors.blue.shade800,
      surface: Colors.blue.shade700,
      background: Colors.black,
      error: Colors.red,
      onPrimary: Colors.indigo.shade200,
      onSecondary: Colors.indigo.shade200,
      onSurface: Colors.white,
      onBackground: Colors.black,
      onError: Colors.white,
      brightness: Brightness.dark,
  );

}