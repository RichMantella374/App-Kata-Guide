import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:app_kata/services/progress_service.dart';

class VideoPlayerPage extends StatefulWidget {
  final String beltId;
  final String sectionId; // Se usa para marcar como visto
  final String videoId;

  const VideoPlayerPage({
    super.key,
    required this.beltId,
    required this.sectionId,
    required this.videoId,
  });

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late YoutubePlayerController _controller;
  final ProgressService _progressService = ProgressService();
  bool _markedAsViewed = false;

  @override
  void initState() {
    super.initState();
    print('beltId: ${widget.beltId}');
    print('sectionId: ${widget.sectionId}');
    print('videoId: ${widget.videoId}');
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        disableDragSeek: false,
      ),
    )..addListener(_onPlayerStateChange);
  }

  void _onPlayerStateChange() async {
    if (_controller.value.playerState == PlayerState.ended &&
        !_markedAsViewed) {
      _markedAsViewed = true;
      final userId = await _progressService.getCurrentUserId();
      if (userId != null) {
        await _progressService.markVideoAsViewed(
          userId: userId,
          beltId: widget.beltId,
          sectionId: widget.sectionId,
          videoUrl: widget.videoId,
        );
      }
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Video marcado como visto')),
        );
      }
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onPlayerStateChange);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: _controller),
      builder:
          (context, player) => Scaffold(
            appBar: AppBar(title: const Text("Reproduciendo video")),
            body: Center(child: player),
          ),
    );
  }
}
