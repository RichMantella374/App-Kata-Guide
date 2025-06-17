import 'package:supabase_flutter/supabase_flutter.dart';

class ProgressService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<String?> getCurrentUserId() async {
    final user = _supabase.auth.currentUser;
    return user?.id;
  }

  Future<void> initializeBeltProgressIfNeeded(String userId) async {
    final existing = await _supabase
        .from('belt_progress')
        .select()
        .eq('user_id', userId);

    if (existing.isEmpty) {
      const beltOrder = [
        'white',
        'yellow',
        'orange',
        'green',
        'blue',
        'brown',
        'red',
        'black'
      ];
      for (int i = 0; i < beltOrder.length; i++) {
        await _supabase.from('belt_progress').insert({
          'user_id': userId,
          'belt_id': beltOrder[i],
          'unlocked': beltOrder[i] == 'white',
        });
      }
    }
  }

  Future<bool> isBeltUnlocked(String userId, String beltId) async {
    final data = await _supabase
        .from('belt_progress')
        .select('unlocked')
        .eq('user_id', userId)
        .eq('belt_id', beltId)
        .maybeSingle();

    return data != null && data['unlocked'] == true;
  }

  Future<void> markVideoAsViewed({
    required String userId,
    required String beltId,
    required String sectionId,
    required String videoUrl,
  }) async {
    final existing = await _supabase
        .from('viewed_videos')
        .select()
        .eq('user_id', userId)
        .eq('belt_id', beltId)
        .eq('section_id', sectionId)
        .maybeSingle();

    if (existing == null) {
      await _supabase.from('viewed_videos').insert({
        'user_id': userId,
        'belt_id': beltId,
        'section_id': sectionId,
        'video_url': videoUrl,
      });
    }

    await _checkAndUnlockNextBelt(userId, beltId);
  }

  Future<void> _checkAndUnlockNextBelt(String userId, String beltId) async {
    final videos = BeltVideos.videos[beltId] ?? [];
    final viewed = await _supabase
        .from('viewed_videos')
        .select()
        .eq('user_id', userId)
        .eq('belt_id', beltId);

    if (viewed.length >= videos.length) {
      const beltOrder = [
        'white',
        'yellow',
        'orange',
        'green',
        'blue',
        'brown',
        'red',
        'black'
      ];
      final currentIndex = beltOrder.indexOf(beltId);
      if (currentIndex < beltOrder.length - 1) {
        final nextBelt = beltOrder[currentIndex + 1];
        await _supabase
            .from('belt_progress')
            .update({'unlocked': true})
            .eq('user_id', userId)
            .eq('belt_id', nextBelt);
      }
    }
  }

  Future<List<Map<String, dynamic>>> getViewedVideos(String userId, String beltId) async {
    return await _supabase
        .from('viewed_videos')
        .select()
        .eq('user_id', userId)
        .eq('belt_id', beltId);
  }
}

class BeltVideos {
  static const Map<String, List<Map<String, String>>> videos = {
    'white': [
      {'id': '1', 'title': 'Oi Zuki', 'url': 'https://example.com/oi_zuki'},
      {'id': '2', 'title': 'Gedan Barai', 'url': 'https://example.com/gedan_barai'},
    ],
    'yellow': [
      {'id': '1', 'title': 'Mae Geri', 'url': 'https://example.com/mae_geri'},
      {'id': '2', 'title': 'Age Uke', 'url': 'https://example.com/age_uke'},
    ],
    // Añadir más si es necesario
  };
}