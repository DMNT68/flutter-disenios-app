import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {

  bool _darkTheme = false;
  bool _customTheme = false;

  ThemeData _currentTheme;

  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;
  ThemeData get currentTheme => this._currentTheme;

  ThemeChanger(int theme) {

    switch (theme) {
      case 1 : // light
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light().copyWith(accentColor: Colors.pink);
        break;

      case 2 : // dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark().copyWith(
          accentColor: Colors.pink
        );
        break;

      case 2 : // custom
        _darkTheme = false;
        _customTheme = true;
        break;

      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
    }

  }

  set darkTheme (bool value) {
    this._customTheme = false;
    this._darkTheme = value;

    if (value) {
      _currentTheme = ThemeData.dark().copyWith(
        accentColor: Colors.pink
      );
    } else {
      _currentTheme = ThemeData.light().copyWith(accentColor: Colors.pink);
    }

    notifyListeners();
  }

  set customTheme (bool value) {
    this._customTheme = value;
    this._darkTheme = false;

    if (value) {
      _currentTheme = ThemeData.dark().copyWith(
        accentColor: Color(0xff48a0eb),
        primaryColorLight: Colors.white,
        scaffoldBackgroundColor: Color(0xff16202b),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white) 
        ),
        appBarTheme: AppBarTheme(backgroundColor:  Color(0xff16202b) )
      );
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }

}