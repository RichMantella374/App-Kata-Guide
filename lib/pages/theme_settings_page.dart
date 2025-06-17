import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';

class ThemeSettingsPage extends StatelessWidget {
  const ThemeSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.appThemeMode == AppThemeMode.dark;

    return Scaffold(
      appBar: AppBar(title: const Text("Configuración de tema")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              title: const Text("Modo oscuro"),
              value: isDarkMode,
              onChanged: (value) {
                themeProvider.setThemeMode(
                  value ? AppThemeMode.dark : AppThemeMode.light,
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              "Color primario",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children:
                  ThemeProvider.materialColors.map((color) {
                    return GestureDetector(
                      onTap: () => themeProvider.setColorTheme(color),
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: color,
                        child:
                            themeProvider.primaryColor == color
                                ? const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 18,
                                )
                                : null,
                      ),
                    );
                  }).toList(),
            ),
            const SizedBox(height: 30),
            const Text(
              "Vista previa",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ThemePreview(color: themeProvider.primaryColor),
          ],
        ),
      ),
    );
  }
}

class ThemePreview extends StatelessWidget {
  final Color color;

  const ThemePreview({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Generar un color más claro u oscuro dependiendo del modo
    final cardColor =
        isDark ? _darkenColor(color, 0.3) : _lightenColor(color, 0.3);
    final textColor = isDark ? Colors.white : Colors.black87;

    return Card(
      color: cardColor,
      child: ListTile(
        leading: CircleAvatar(backgroundColor: color),
        title: Text(
          "Este es un ejemplo de estilo",
          style: TextStyle(color: textColor),
        ),
        subtitle: Text(
          "El color y el modo se aplican aquí",
          // ignore: deprecated_member_use
          style: TextStyle(color: textColor.withOpacity(0.75)),
        ),
        trailing: Icon(Icons.settings, color: textColor),
      ),
    );
  }

  /// Aclara un color dado [amount] entre 0 y 1
  Color _lightenColor(Color color, double amount) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final lightened = hsl.withLightness(
      (hsl.lightness + amount).clamp(0.0, 1.0),
    );
    return lightened.toColor();
  }

  /// Oscurece un color dado [amount] entre 0 y 1
  Color _darkenColor(Color color, double amount) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final darkened = hsl.withLightness(
      (hsl.lightness - amount).clamp(0.0, 1.0),
    );
    return darkened.toColor();
  }
}
