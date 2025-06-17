import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;
import 'routes/app_router.dart';
import 'theme/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables if available
  try {
    await dotenv.dotenv.load(fileName: ".env");
  } catch (e) {
    // Fallback to hardcoded values if .env file is not available
    // ignore: avoid_print
    print('Warning: .env file not found. Using default values.');
  }

  // Get Supabase URL and key from environment variables or use defaults
  final supabaseUrl =
      dotenv.dotenv.env['SUPABASE_URL'] ??
      'https://gruxloggaqxisdsedvyi.supabase.co';
  final supabaseKey =
      dotenv.dotenv.env['SUPABASE_KEY'] ??
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdydXhsb2dnYXF4aXNkc2VkdnlpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDc4MzI2NTgsImV4cCI6MjA2MzQwODY1OH0.nLJH6OnTjQD3CyfI5YugpIeRoM0L76CkrShYUzcAipQ';

  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Kata-guide',
      theme: themeProvider.lightTheme,
      darkTheme: themeProvider.darkTheme,
      themeMode: themeProvider.themeMode,
      routerConfig: AppRouter.router,
    );
  }
}
