import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.light;

  changeTheme(ThemeMode theme){
    themeMode = theme;
    notifyListeners();
  }


}