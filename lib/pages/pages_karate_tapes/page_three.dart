import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:app_kata/pages/pages_karate_tapes/videos/belt_videos.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});
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
                  "Cinta Amarilla",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Text("5° kyu", style: TextStyle(fontSize: 14)),
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
              "Como el sol que rompe el alba, la cinta amarilla ilumina tu creciente dominio. Las defensas se vuelven contraataques, los reflejos aguzan como garras. Aquí descubres que el karate no es sólo fuerza: es precisión tallada en mil repeticiones.",
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
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos/amarilla/kake%20dachi.png",
                        width: 200,
                        height: 200,
                      ),
                      Text("Kake Dachi", style: TextStyle(fontSize: 16)),
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
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos/amarilla/uke%20nagashi.png",
                        width: 200,
                        height: 200,
                      ),
                      Text("Uke nagashi", style: TextStyle(fontSize: 16)),
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
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos/amarilla/kuamde%20log.png",
                        width: 200,
                        height: 200,
                      ),
                      Text("Kumade", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Image.network(
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos/amarilla/shotei%20log.jpg",
                        width: 200,
                        height: 200,
                      ),
                      Text("Shotei", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Image.network(
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos/amarilla/tetsui%20log.jpeg",
                        width: 200,
                        height: 200,
                      ),
                      Text("Tetsui", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Image.network(
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos/amarilla/tobi%20mawashi%20geri%20log.png",
                        width: 200,
                        height: 200,
                      ),
                      Text("Tobi mawashi geri", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ],
            ),
             Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Image.network(
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos/amarilla/ushiro%20geri%20log.png",
                        width: 200,
                        height: 200,
                      ),
                      Text("Ushiro geri", style: TextStyle(fontSize: 16)),
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
                        BeltVideos.allVideos['blanca']?['video1'] ?? '',
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
                  '/video?beltId=blanca&sectionId=video1&videoId=${BeltVideos.allVideos['amarilla']?['video1'] ?? ''}',
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
