import 'package:flutter/material.dart';

class ThemeModel {
  final ThemeData themedata;
  final String name;

  const ThemeModel({this.name, this.themedata});

  static ThemeModel getTheme(String name) {
    if (name == "light") {
      return ThemeModel(
          name: 'light',
          themedata: ThemeData(
            brightness: Brightness.light,
            accentColor: Colors.black,
            primaryColor: Colors.white,
            buttonColor: Colors.yellow,
          ));
    } else {
      return ThemeModel(
          name: 'dark',
          themedata: ThemeData(
            brightness: Brightness.dark,
            accentColor: Colors.white,
            fontFamily: 'Ubuntu',
            primaryColor: Colors.black,
            buttonColor: Colors.red,
          ));
    }
  }
}
