import 'package:app_kata/pages/pages_karate_tapes/videos/video_player_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../pages/register_page.dart';
import '../pages/profile_page.dart';
import '../pages/user_management_page.dart';
import '../pages/pages_karate_tapes/page_one.dart';
import '../pages/pages_karate_tapes/page_two.dart';
import '../pages/pages_karate_tapes/page_three.dart';
import '../pages/pages_karate_tapes/page_four.dart';
import '../pages/pages_karate_tapes/page_five.dart';
import '../pages/pages_karate_tapes/page_six.dart';
import '../pages/pages_karate_tapes/page_seven.dart';
import '../pages/pages_karate_tapes/page_eight.dart';
import '../pages/splash_screen.dart';
import '../pages/theme_settings_page.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/splash',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isSplash = state.matchedLocation == '/splash';
      if (isSplash) return null; // Nunca redirigir desde Splash

      final session = Supabase.instance.client.auth.currentSession;
      final isLoggedIn = session != null;
      final isGoingToLogin = state.matchedLocation == '/login';
      final isGoingToRegister = state.matchedLocation == '/register';
      // If not logged in and not going to login or register, redirect to login

      if (!isLoggedIn && !isGoingToLogin && !isGoingToRegister) {
        return '/login';
      }
      // If logged in and going to login or register, redirect to home

      if (isLoggedIn && (isGoingToLogin || isGoingToRegister)) {
        return '/';
      }

      return null;
    },

    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: '/manage-users',
        builder: (context, state) => const UserManagementPage(),
      ),
      GoRoute(
        path: '/page_one',
        name: 'page_one',
        builder: (context, state) => const PageOne(),
      ),
      GoRoute(
        path: '/page_two',
        name: 'page_two',
        builder: (context, state) => const PageTwo(),
      ),
      GoRoute(
        path: '/page_three',
        name: 'page_three',
        builder: (context, state) => const PageThree(),
      ),
      GoRoute(
        path: '/page_four',
        name: 'page_four',
        builder: (context, state) => const PageFour(),
      ),
      GoRoute(
        path: '/page_five',
        name: 'page_five',
        builder: (context, state) => const PageFive(),
      ),
      GoRoute(
        path: '/page_six',
        name: 'page_six',
        builder: (context, state) => const PageSix(),
      ),
      GoRoute(
        path: '/page_seven',
        name: 'page_seven',
        builder: (context, state) => const PageSeven(),
      ),
      GoRoute(
        path: '/page_eight',
        name: 'page_eight',
        builder: (context, state) => const PageEight(),
      ),
      GoRoute(
        path: '/theme-settings',
        builder: (context, state) => const ThemeSettingsPage(),
      ),

      GoRoute(
        path: '/theme-settings',
        name: 'theme-settings',
        builder: (context, state) => const ThemeSettingsPage(),
      ),
      GoRoute(
        path: '/video',
        builder: (context, state) {
          final beltId = state.uri.queryParameters['beltId'] ?? '';
          final sectionId = state.uri.queryParameters['sectionId'] ?? '';
          final videoId = state.uri.queryParameters['videoId'] ?? '';
          return VideoPlayerPage(
            beltId: beltId,
            sectionId: sectionId,
            videoId: videoId,
          );
        },
      ),
    ],

    errorBuilder:
        (context, state) =>
            Scaffold(body: Center(child: Text('Error: ${state.error}'))),
  );
}
