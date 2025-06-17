import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserManagementPage extends StatefulWidget {
  const UserManagementPage({super.key});

  @override
  State<UserManagementPage> createState() => _UserManagementPageState();
}

class _UserManagementPageState extends State<UserManagementPage> {
  final supabase = Supabase.instance.client;
  List<dynamic> _users = [];
  bool _loading = true;
  String? currentUserId;

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    try {
      currentUserId = supabase.auth.currentUser?.id;

      final response = await supabase
          .from('profiles')
          .select('id, username, is_admin');

      setState(() {
        _users = response;
        _loading = false;
      });
    } catch (e) {
      setState(() => _loading = false);
      ScaffoldMessenger.of(
        // ignore: use_build_context_synchronously
        context,
      ).showSnackBar(SnackBar(content: Text('Error al cargar usuarios: $e')));
    }
  }

  Future<void> _toggleAdmin(String userId, bool isAdmin) async {
    try {
      await supabase
          .from('profiles')
          .update({'is_admin': !isAdmin})
          .eq('id', userId);

      _loadUsers(); // Refresca la lista
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al actualizar permisos: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Scaffold(
        appBar: AppBar(title: Text("Gestión de Usuarios")),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Gestión de Usuarios")),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          final user = _users[index];
          final isCurrentUser = user['id'] == currentUserId;
          final isAdmin = user['is_admin'] == true;

          return ListTile(
            leading: const Icon(Icons.person),
            title: Text(user['username'] ?? 'Sin nombre'),
            subtitle: Text(user['username'] ?? 'Sin nombre'),
            trailing:
                isCurrentUser
                    ? const Text('Tú', style: TextStyle(color: Colors.grey))
                    : ElevatedButton(
                      onPressed: () => _toggleAdmin(user['id'], isAdmin),
                      child: Text(isAdmin ? 'Quitar admin' : 'Asignar admin'),
                    ),
          );
        },
      ),
    );
  }
}
