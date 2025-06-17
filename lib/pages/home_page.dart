// ignore_for_file: deprecated_member_use

import 'package:app_kata/theme/theme_provider.dart';
import 'package:app_kata/theme/theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import 'calendar_page.dart';
import 'profile_page.dart';
import 'user_management_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _authService = AuthService();
  bool _isAdmin = false;
  bool _isLoading = true;
  int _selectedIndex = 0;

  final List<Color> cardColors = [
    Colors.grey[600]!,
    Colors.purple[100]!,
    Colors.yellow[100]!,
    Colors.orange[100]!,
    Colors.green[100]!,
    Colors.blue[100]!,
    Colors.brown[400]!,
    Colors.black,
  ];

  final List<String> sectionTexts = [
    'Introducción a los fundamentos básicos.\nPara principiantes',
    'Técnicas intermedias y control corporal.',
    'Desarrollo de agilidad y defensa personal',
    'Trabajo de precisión y equilibrio. ',
    'Consolidación de técnicas y formas.',
    'Entrenamiento avanzado y estrategias.',
    'Preparación para grados superiores.',
    'Dominio completo y maestría técnica.',
  ];

  @override
  void initState() {
    super.initState();
    _checkAdmin();
  }

  void _checkAdmin() async {
    try {
      final isAdmin = await _authService.isAdmin();
      if (mounted) {
        setState(() {
          _isAdmin = isAdmin;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error al verificar permisos: ${e.toString()}"),
          ),
        );
      }
    }
  }

  void _signOut() async {
    try {
      await _authService.signOut();
      if (!mounted) return;
      context.go('/login');
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error al cerrar sesión: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final themeProvider = Provider.of<ThemeProvider>(context);

    final List<Widget> widgetOptions = <Widget>[
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: 8,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final subtitles = [
                    'Cinta blanca',
                    'Cinta morada',
                    'Cinta amarilla',
                    'Cinta naranja',
                    'Cinta verde',
                    'Cinta azul',
                    'Cinta café',
                    'Cinta negra',
                  ];

                  final routes = [
                    '/page_one',
                    '/page_two',
                    '/page_three',
                    '/page_four',
                    '/page_five',
                    '/page_six',
                    '/page_seven',
                    '/page_eight',
                  ];

                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: cardColors[index], width: 2),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ExpansionTile(
                      title: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          cardColors[index].withOpacity(0.6),
                          BlendMode.modulate,
                        ),
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            cardColors[index].withOpacity(0.6),
                            BlendMode.modulate,
                          ),
                          child: Builder(
                            builder: (BuildContext context) {
                              String imageUrl;
                              switch (index) {
                                case 0:
                                  imageUrl =
                                      "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cintas//1748136871981.png";
                                  break;
                                case 1:
                                  imageUrl =
                                      "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cintas//1748137280285.png";
                                  break;
                                case 2:
                                  imageUrl =
                                      "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cintas//1748137011231.png";
                                  break;
                                case 3:
                                  imageUrl =
                                      "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cintas//1748137164192.png";
                                  break;
                                case 4:
                                  imageUrl =
                                      "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cintas//1748137674571.png";
                                  break;
                                case 5:
                                  imageUrl =
                                      "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cintas//1748137422838.png";
                                  break;
                                case 6:
                                  imageUrl =
                                      "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cintas//1748137900046.png";
                                  break;
                                case 7:
                                  imageUrl =
                                      "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cintas//1748137944431.png";
                                  break;
                                default:
                                  imageUrl =
                                      "https://via.placeholder.com/150"; // Imagen por defecto
                              }
                              return Image.network(
                                imageUrl,
                                fit: BoxFit.fitWidth,
                              );
                            },
                          ),
                        ),
                      ),
                      subtitle: Text(
                        subtitles[index],
                        style: const TextStyle(fontSize: 14),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            16.0,
                            0.0,
                            16.0,
                            16.0,
                          ),
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    sectionTexts[index],
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(height: 10),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: cardColors[index],
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 32,
                                        vertical: 12,
                                      ),
                                      textStyle: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onPressed: () {
                                      print('Navegando a: ${routes[index]}');
                                      context.go(routes[index]);
                                    },
                                    child: const Text('Empezar'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      const CalendarPage(),
      const ProfilePage(),
      if (_isAdmin) const UserManagementPage(),
    ];

    final appBar = AppBar(
      title: const Text('Página Principal'),
      actions: [
        ThemeSwitcher(),
        IconButton(icon: const Icon(Icons.logout), onPressed: _signOut),
      ],
    );

    final body =
        _isLoading
            ? const Center(child: CircularProgressIndicator())
            : widgetOptions[_selectedIndex];

    final bottomNav = BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index) => setState(() => _selectedIndex = index),
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor: Colors.grey,
      backgroundColor:
          Theme.of(context).bottomAppBarColor ??
          Theme.of(context).scaffoldBackgroundColor,
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        const BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Calendario',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
        if (_isAdmin)
          const BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts),
            label: 'Usuarios',
          ),
      ],
    );

    return Stack(
      children: [
        Consumer<ThemeProvider>(
          builder: (context, themeProvider, _) {
            final isDarkMode = themeProvider.appThemeMode == AppThemeMode.dark;
            return Image.network(
              isDarkMode
                  ? 'https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cintas//fondo%202.jpg'
                  : 'https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cintas//fondo.jpeg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            );
          },
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: appBar,
          body: body,
          bottomNavigationBar: bottomNav,
          extendBodyBehindAppBar: true,
          extendBody: true,
        ),
      ],
    );
  }
}

extension on ThemeData {
  get bottomAppBarColor => scaffoldBackgroundColor;
}
