// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  AppThemeMode _appThemeMode = AppThemeMode.light;
  Color _primaryColor = Colors.indigo;

  ThemeProvider() {
    _loadSettings(); // ← Carga las preferencias al instanciar
  }

  AppThemeMode get appThemeMode => _appThemeMode;
  Color get primaryColor => _primaryColor;

  ThemeMode get themeMode {
    return _appThemeMode == AppThemeMode.dark
        ? ThemeMode.dark
        : ThemeMode.light;
  }

  ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _primaryColor,
        brightness: Brightness.light,
      ),
    );
  }

  ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _primaryColor,
        brightness: Brightness.dark,
      ),
    );
  }

  void setThemeMode(AppThemeMode mode) {
    _appThemeMode = mode;
    _saveSettings();
    notifyListeners();
  }

  void setColorTheme(Color color) {
    _primaryColor = color;
    _saveSettings();
    notifyListeners();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final modeIndex = prefs.getInt('appThemeMode') ?? 0;
    final colorValue = prefs.getInt('primaryColor') ?? Colors.indigo.value;

    _appThemeMode = AppThemeMode.values[modeIndex];
    _primaryColor = Color(colorValue); // ← Ahora puede ser cualquier color

    notifyListeners();
  }

  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('appThemeMode', _appThemeMode.index);
    await prefs.setInt('primaryColor', _primaryColor.value);
  }

  // Esto sigue siendo útil para mostrar solo una lista visual de colores sugeridos
  static final List<MaterialColor> materialColors = [
    Colors.indigo,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.amber,
    Colors.cyan,
  ];
}

enum AppThemeMode { light, dark }
