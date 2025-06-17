// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';

class ThemeToggleSwitch extends StatelessWidget {
  const ThemeToggleSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Row(
      children: [
        const Icon(Icons.light_mode, size: 20),
        Transform.scale(
          scale: 0.8,
          child: Switch(
            value: isDarkMode,
            onChanged: (value) {
              AppThemeMode newThemeMode =
                  isDarkMode ? AppThemeMode.light : AppThemeMode.dark;
              themeProvider.setThemeMode(newThemeMode);
            },
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,
            inactiveTrackColor: Colors.grey,
            inactiveThumbColor: Colors.white,
          ),
        ),
        const Icon(Icons.dark_mode, size: 20),
      ],
    );
  }
}
