import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), // tiempo del splash
    )..forward();

    Future.delayed(const Duration(seconds: 3), () {
      final session = Supabase.instance.client.auth.currentSession;
      final isLoggedIn = session != null;

      if (!mounted) return;

      if (isLoggedIn) {
        context.go('/');
      } else {
        context.go('/login');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0F2027), Color(0xFF2C5364)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Center(
            child: FadeTransition(
              opacity: _controller,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    MaterialCommunityIcons.karate,
                    size: 100,
                    color: Colors.white,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Karate App",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
