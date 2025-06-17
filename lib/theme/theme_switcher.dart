// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return PopupMenuButton(
      icon: const Icon(Icons.color_lens),
      itemBuilder:
          (context) => <PopupMenuEntry>[
            PopupMenuItem(
              enabled: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Color principal",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        tooltip: "Modo claro",
                        onPressed: () {
                          themeProvider.setThemeMode(AppThemeMode.light);
                        },
                        icon: const Icon(Icons.wb_sunny),
                      ),
                      IconButton(
                        tooltip: "Modo oscuro",
                        onPressed: () {
                          themeProvider.setThemeMode(AppThemeMode.dark);
                        },
                        icon: const Icon(Icons.nightlight_round),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const PopupMenuDivider(),
            PopupMenuItem(
              enabled: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Color principal",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    children: [
                      _buildColorDot(context, Colors.blue),
                      _buildColorDot(context, Colors.red),
                      _buildColorDot(context, Colors.green),
                      _buildColorDot(context, Colors.orange),
                      _buildColorDot(context, Colors.purple),
                    ],
                  ),
                ],
              ),
            ),
            const PopupMenuDivider(),
            PopupMenuItem(
              child: const Text("Elegir otro color..."),
              onTap: () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _showColorPicker(context, themeProvider);
                });
              },
            ),
            PopupMenuItem(
              child: const Text("Restablecer tema predeterminado"),
              onTap: () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  themeProvider.setColorTheme(Colors.indigo);
                  themeProvider.setThemeMode(AppThemeMode.light);
                });
              },
            ),
          ],
    );
  }

  void _showColorPicker(BuildContext context, ThemeProvider themeProvider) {
    Color tempColor = themeProvider.primaryColor;

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text("Selecciona un color"),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: tempColor,
                onColorChanged: (color) {
                  tempColor = color;
                },
                enableAlpha: false,
                showLabel: true,
                pickerAreaHeightPercent: 0.8,
              ),
            ),
            actions: [
              TextButton(
                child: const Text("Cancelar"),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: const Text("Seleccionar"),
                onPressed: () {
                  themeProvider.setColorTheme(tempColor);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
    );
  }

  Widget _buildColorDot(BuildContext context, MaterialColor color) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return GestureDetector(
      onTap: () => themeProvider.setColorTheme(color),
      child: CircleAvatar(
        radius: 12,
        backgroundColor: color,
        child:
            themeProvider.primaryColor == color
                ? const Icon(Icons.check, color: Colors.white, size: 16)
                : null,
      ),
    );
  }
}
