import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../theme/theme_provider.dart';
import '../services/auth_service.dart';
import '../services/supabase_storage_service.dart';
import 'login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _authService = AuthService();
  final _storageService = SupabaseStorageService();
  String? _avatarUrl;
  String? _username;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAvatar();
    _loadUsername();
  }

  Future<void> _loadAvatar() async {
    final userId = _authService.currentUser?.id;
    if (userId == null) return;

    final url = _storageService.getAvatarUrl(userId);
    setState(() {
      _avatarUrl = url;
      _isLoading = false;
    });
  }

  Future<void> _loadUsername() async {
    final userId = _authService.currentUser?.id;
    if (userId == null) return;

    try {
      final response =
          await Supabase.instance.client
              .from('profiles')
              .select('username')
              .eq('id', userId)
              .single();

      setState(() {
        _username = response['username'] as String?;
      });
    } catch (e) {
      // Si no se encuentra el usuario, crear un perfil
      if (e is PostgrestException && e.code == 'PGRST116') {
        await Supabase.instance.client.from('profiles').insert({
          'id': userId,
          'username':
              _authService.currentUser?.email?.split('@')[0] ?? 'Nuevo usuario',
        });
        // Volver a cargar el nombre de usuario
        final response =
            await Supabase.instance.client
                .from('profiles')
                .select('username')
                .eq('id', userId)
                .single();
        setState(() {
          _username = response['username'] as String?;
        });
      } else {
        // Manejar otros errores
        // ignore: avoid_print
        print('Error al cargar el nombre de usuario: $e');
      }
    }
  }

  Future<void> _uploadAvatar() async {
    final userId = _authService.currentUser?.id;
    if (userId == null) return;

    try {
      await _storageService.uploadAvatar(userId);
      await _loadAvatar();

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Avatar actualizado correctamente')),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        // ignore: use_build_context_synchronously
        context,
      ).showSnackBar(SnackBar(content: Text('Error al subir el avatar: $e')));
    }
  }

  Future<void> _deleteAvatar() async {
    final userId = _authService.currentUser?.id;
    if (userId == null) return;

    try {
      await _storageService.deleteAvatar(userId);
      setState(() => _avatarUrl = null);

      ScaffoldMessenger.of(
        // ignore: use_build_context_synchronously
        context,
      ).showSnackBar(const SnackBar(content: Text('Avatar eliminado')));
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al eliminar el avatar: $e')),
      );
    }
  }

  Future<void> _changeName() async {
    final controller = TextEditingController();

    await showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text("Cambiar nombre de usuario"),
            content: TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: "Nuevo nombre"),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancelar"),
              ),
              TextButton(
                onPressed: () async {
                  final newName = controller.text.trim();
                  if (newName.isNotEmpty) {
                    await Supabase.instance.client
                        .from('profiles')
                        .update({'username': newName})
                        .eq('id', _authService.currentUser!.id);
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Nombre actualizado')),
                    );
                  }
                },
                child: const Text("Guardar"),
              ),
            ],
          ),
    );
  }

  Future<void> _changePassword() async {
    final controller = TextEditingController();

    await showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text("Cambiar contraseña"),
            content: TextField(
              controller: controller,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Nueva contraseña"),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancelar"),
              ),
              TextButton(
                onPressed: () async {
                  final newPass = controller.text;
                  if (newPass.length >= 6) {
                    await Supabase.instance.client.auth.updateUser(
                      UserAttributes(password: newPass),
                    );
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Contraseña actualizada')),
                    );
                  }
                },
                child: const Text("Actualizar"),
              ),
            ],
          ),
    );
  }

  Future<void> _deleteAccount() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text("Eliminar cuenta"),
            content: const Text(
              "¿Estás seguro? Esta acción no se puede deshacer.",
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text("Cancelar"),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text("Eliminar"),
              ),
            ],
          ),
    );

    if (confirmed == true) {
      final userId = _authService.currentUser?.id;
      if (userId != null) {
        await _storageService.deleteAvatar(userId);
        await Supabase.instance.client
            .from('profiles')
            .delete()
            .eq('id', userId);
        await _authService.signOut();

        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final user = _authService.currentUser;

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
          appBar: AppBar(
            title: const Text('Perfil'),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body:
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              _avatarUrl != null
                                  ? NetworkImage(_avatarUrl!)
                                  : null,
                          child:
                              _avatarUrl == null
                                  ? const Icon(Icons.person, size: 50)
                                  : null,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _username ?? '',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 20),
                        ListTile(
                          leading: const Icon(Icons.image),
                          title: const Text('Cambiar avatar'),
                          onTap: _uploadAvatar,
                        ),
                        ListTile(
                          leading: const Icon(Icons.delete_forever),
                          title: const Text('Eliminar avatar'),
                          onTap: _deleteAvatar,
                        ),
                        ListTile(
                          leading: const Icon(Icons.edit),
                          title: const Text('Cambiar nombre de usuario'),
                          onTap: _changeName,
                        ),
                        ListTile(
                          leading: const Icon(Icons.lock),
                          title: const Text('Cambiar contraseña'),
                          onTap: _changePassword,
                        ),
                        ListTile(
                          leading: const Icon(Icons.color_lens),
                          title: const Text('Personalizar tema'),
                          onTap: () => context.push('/theme-settings'),
                        ),
                        ListTile(
                          leading: const Icon(Icons.person_off),
                          title: const Text('Eliminar cuenta'),
                          onTap: _deleteAccount,
                        ),
                      ],
                    ),
                  ),
        ),
      ],
    );
  }
}
