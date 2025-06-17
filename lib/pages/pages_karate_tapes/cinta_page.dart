import 'package:flutter/material.dart';
import 'package:app_kata/services/progress_service.dart' as progressService;
import 'package:app_kata/pages/pages_karate_tapes/videos/belt_videos.dart';
import 'package:app_kata/pages/pages_karate_tapes/videos/video_player_page.dart';

class CintaPage extends StatefulWidget {
  final String title;
  final Color color;
  final String beltId;
  final String objetivo;
  final List<String> tecnicas;
  final String kata;
  final List<String> requisitos;
  final String imagenUrl;

  const CintaPage({
    super.key,
    required this.title,
    required this.color,
    required this.beltId,
    required this.objetivo,
    required this.tecnicas,
    required this.kata,
    required this.requisitos,
    required this.imagenUrl,
  });

  @override
  State<CintaPage> createState() => _CintaPageState();
}

class _CintaPageState extends State<CintaPage> {
  final progressService.ProgressService _progressService =
      progressService.ProgressService();
  List<String> viewedVideos = [];
  List<String> videos = [];

  @override
  void initState() {
    super.initState();
    loadVideos();
  }

  Future<void> loadVideos() async {
    final userId = await _progressService.getCurrentUserId();
    if (userId == null) {
      print('Error: userId es nulo');
      return;
    }
    final allVideos =
        BeltVideos.allVideos[widget.beltId]?.values.toList() ?? [];
    final watched =
        (await _progressService.getViewedVideos(
          userId,
          widget.beltId,
        )).map((video) => video['video_url'] as String).toList();

    setState(() {
      videos = allVideos;
      viewedVideos = watched;
    });
  }

  void openVideo(String videoName) {
    final videoId = BeltVideos.allVideos[widget.beltId]?[videoName];
    if (videoId == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Video no encontrado")));
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => VideoPlayerPage(
              beltId: widget.beltId,
              sectionId: '${widget.beltId}_$videoName', // Usamos un ID único
              videoId: videoId,
            ),
      ),
    ).then((_) => loadVideos());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cinta ${widget.title}")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.network(widget.imagenUrl, height: 150)),
            const SizedBox(height: 16),
            Text("Objetivo:", style: Theme.of(context).textTheme.titleLarge),
            Text(widget.objetivo),
            const SizedBox(height: 16),
            Text("Técnicas:", style: Theme.of(context).textTheme.titleLarge),
            ...widget.tecnicas.map((t) => Text("• $t")),
            const SizedBox(height: 16),
            Text("Kata:", style: Theme.of(context).textTheme.titleLarge),
            Text(widget.kata),
            const SizedBox(height: 16),
            Text("Requisitos:", style: Theme.of(context).textTheme.titleLarge),
            ...widget.requisitos.map((r) => Text("• $r")),
            const SizedBox(height: 16),
            Text(
              "Videos de entrenamiento:",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            ...BeltVideos.allVideos[widget.beltId]!.keys.map(
              (videoName) => ListTile(
                title: Text(videoName),
                trailing:
                    viewedVideos.contains('${widget.beltId}_$videoName')
                        ? const Icon(Icons.check, color: Colors.green)
                        : const Icon(Icons.play_arrow),
                onTap: () => openVideo(videoName),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
