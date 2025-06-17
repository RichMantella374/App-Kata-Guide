import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService {
  final SupabaseClient _client = Supabase.instance.client;
  final String bucketName = 'usuariosup';

  /// Sube un archivo al bucket 'usuariosup/avatars/{userId}.jpg'
  Future<void> uploadAvatar(String userId) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true, // necesario para web y compatibilidad multiplataforma
    );

    if (result != null && result.files.single.bytes != null) {
      final Uint8List fileBytes = result.files.single.bytes!;
      final String fileName = 'avatars/$userId.jpg';

      // ignore: avoid_print
      print('Bucket Name: $bucketName');
      // ignore: avoid_print
      print('File Name: $fileName');
      await _client.storage
          .from(bucketName)
          .uploadBinary(
            fileName,
            fileBytes,
            fileOptions: const FileOptions(upsert: true),
          );
    } else {
      throw Exception("No se seleccionó ningún archivo.");
    }
  }

  /// Obtiene la URL pública del avatar
  String getAvatarUrl(String userId) {
    final imageUrl = Supabase.instance.client.storage
        .from('usuariosup')
        .getPublicUrl('avatars/$userId.jpg');
    return '$imageUrl?cacheBust=${DateTime.now().millisecondsSinceEpoch}';
  }

  /// Elimina el avatar del usuario
  Future<void> deleteAvatar(String userId) async {
    final String path = 'avatars/$userId.jpg';
    await _client.storage.from(bucketName).remove([path]);
  }
}
