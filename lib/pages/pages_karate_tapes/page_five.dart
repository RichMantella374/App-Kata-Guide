import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:app_kata/pages/pages_karate_tapes/videos/belt_videos.dart';

class PageFive extends StatelessWidget {
  const PageFive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/');
          },
        ),
        title: const Align(
          alignment: Alignment.topLeft,
          child: Text(
            'ENTRENAMIENTO',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Cinta Verde",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Text("3° kyu", style: TextStyle(fontSize: 14)),
                SizedBox(width: 8),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 1,
              color: const Color.fromARGB(255, 209, 209, 209),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 25,
            ),
            const SizedBox(height: 8),
            Text(
              "Verde como el bosque en primavera: tu arte crece y se ramifica. Las técnicas avanzadas florecen, adaptándose como bambú ante el viento. Ahora ves el dojo en cada gesto cotidiano, porque la disciplina ha echado raíces en tu vida.",
              style: TextStyle(fontSize: 13),
              textAlign: TextAlign.justify,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 25,
            ),
            Text(
              "Tachikatas",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 1,
              color: const Color.fromARGB(255, 209, 209, 209),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 25,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Image.network(
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos/verde/Tsuruachi%20dachi.png",
                        width: 200,
                        height: 200,
                      ),
                      Text("Tsuruachi Dachi", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ],
            ),
            
            //-------------------------------------------------------
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 25,
            ),
            Text(
              "Ukes",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 1,
              color: const Color.fromARGB(255, 209, 209, 209),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 25,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Image.network(
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos/verde/kakate%20uke.png",
                        width: 200,
                        height: 200,
                      ),
                      Text("Kakate uke", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Image.network(
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos/verde/morote%20tsuki%20(uke).png",
                        width: 200,
                        height: 200,
                      ),
                      Text("Morote tsuki", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ],
            ),
            

            //----------------------------------------------------------------------------------
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 25,
            ),
            Text(
              "Logeixis",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 1,
              color: const Color.fromARGB(255, 209, 209, 209),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 25,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Image.network(
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos/verde/hiza%20geri%20log.png",
                        width: 200,
                        height: 200,
                      ),
                      Text("Hiza geri", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Image.network(
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos/verde/ippon%20nukite%20log.png",
                        width: 200,
                        height: 200,
                      ),
                      Text("Ippon nukite", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ],
            ),Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Image.network(
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos/verde/llama%20tsuki%20log.png",
                        width: 200,
                        height: 200,
                      ),
                      Text("Llaa tsuki", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Image.network(
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos/verde/nihon%20nikite%20log.png",
                        width: 200,
                        height: 200,
                      ),
                      Text("Nihon nikite", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ],
            ),Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Image.network(
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos/verde/ura%20mawashi%20geri%20log.png",
                        width: 200,
                        height: 200,
                      ),
                      Text("Ura mawashi geri", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),

              ],
            ),
            //Video de la cinta blanca
            YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId:
                      YoutubePlayer.convertUrlToId(
                        BeltVideos.allVideos['verde']?['video1'] ?? '',
                      ) ??
                      '',
                  flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
                ),
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.blueAccent,
              ),
              builder: (context, player) {
                return Column(
                  children: [
                    const Text(
                      "Video de entrenamiento",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    player,
                  ],
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                context.go(
                  '/video?beltId=blanca&sectionId=video1&videoId=${BeltVideos.allVideos['verde']?['video1'] ?? ''}',
                );
              },
              child: const Text('Ver video de entrenamiento'),
            ),
          ],
        ),
      ),
    );
  }
}
