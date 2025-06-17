import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../services/auth_service.dart';
import '../widgets/custom_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _authService = AuthService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  bool _isLoading = false;

  void _register() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final email = _emailController.text.trim();
      final password = _passwordController.text;
      final username = _usernameController.text.trim();

      await _authService.signUp(
        email: email,
        password: password,
        username: username,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Registro exitoso. Inicia sesión.")),
      );

      context.go('/login');
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: ${e.toString()}")));
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registro")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                foregroundColor:
                    Colors.white, // ← asegura que el texto sea blanco

                controller: _usernameController,
                label: "Nombre de usuario",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un nombre de usuario';
                  }
                  return null;
                },
                fillColor: Colors.grey.shade100,
                textColor: Colors.black87,
                labelStyle: const TextStyle(color: Colors.black87),
                onFieldSubmitted: (_) {},
              ),
              CustomTextField(
                foregroundColor:
                    Colors.white, // ← asegura que el texto sea blanco

                controller: _emailController,
                label: "Correo",
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu correo';
                  }
                  if (!RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  ).hasMatch(value)) {
                    return 'Ingresa un correo válido';
                  }
                  return null;
                },
                fillColor: Colors.grey.shade100,
                textColor: Colors.black87,
                labelStyle: const TextStyle(color: Colors.black87),
                onFieldSubmitted: (_) {},
              ),
              CustomTextField(
                foregroundColor:
                    Colors.white, // ← asegura que el texto sea blanco

                controller: _passwordController,
                label: "Contraseña",
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu contraseña';
                  }
                  if (value.length < 6) {
                    return 'La contraseña debe tener al menos 6 caracteres';
                  }
                  return null;
                },
                fillColor: Colors.grey.shade100,
                textColor: Colors.black87,
                labelStyle: const TextStyle(color: Colors.black87),
                onFieldSubmitted: (_) {},
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _register,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child:
                      _isLoading
                          ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                          : const Text("Registrarse"),
                ),
              ),
              TextButton(
                onPressed: () => context.go('/login'),
                child: const Text("¿Ya tienes cuenta? Inicia sesión"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
