import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<AuthResponse> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    final res = await _client.auth.signUp(email: email, password: password);

    final userId = res.user?.id;
    if (userId == null) throw Exception("Error al obtener UID.");

    // Crea el perfil en la tabla 'profiles'
    await _client
        .from('profiles')
        .insert({'id': userId, 'username': username});

    return res;
  }

  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    return await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await _client.auth.signOut();
  }

  User? get currentUser => _client.auth.currentUser;

  Future<bool> isAdmin() async {
    final userId = _client.auth.currentUser?.id;
    if (userId == null) return false;

    final res =
        await _client
            .from('profiles')
            .select('is_admin')
            .eq('id', userId)
            .maybeSingle();

    return res != null && res['is_admin'] == true;
  }
}
