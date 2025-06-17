// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:app_kata/pages/pages_karate_tapes/videos/belt_videos.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

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
                  "Cinta Blanca",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Text("10°-7° kyu", style: TextStyle(fontSize: 14)),
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
              "Aquí comienza el camino: el acondicionamiento físico forja tu cuerpo, los saludos cultivan el respeto y las posiciones básicas son los cimientos de todo movimiento. Dominar estos principios es dominar el origen del arte.",
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
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos//musu.png",
                        width: 200,
                        height: 200,
                      ),
                      Text("Musubi Dachi", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Image.network(
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos//hachiji.png",
                        width: 200,
                        height: 200,
                      ),
                      Text("Hachiki dachi", style: TextStyle(fontSize: 16)),
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
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos//senkusu.png",
                        width: 200,
                        height: 200,
                      ),
                      Text("Senkunsu dachi", style: TextStyle(fontSize: 16)),
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
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos//yodan.png",
                        width: 200,
                        height: 200,
                      ),
                      Text("Yodan age uke", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Image.network(
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos//shudan.png",
                        width: 200,
                        height: 200,
                      ),
                      Text("Shudan age uke", style: TextStyle(fontSize: 16)),
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
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos//gedan.png",
                        width: 200,
                        height: 200,
                      ),
                      Text("Gedan barai uke", style: TextStyle(fontSize: 16)),
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
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos//mawa.png",
                        width: 200,
                        height: 200,
                      ),
                      Text("Mawashi geri", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Image.network(
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos//tsuki.png",
                        width: 200,
                        height: 200,
                      ),
                      Text("Senken tsuki", style: TextStyle(fontSize: 16)),
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
                  '/video?beltId=blanca&sectionId=video1&videoId=${BeltVideos.allVideos['blanca']?['video1'] ?? ''}',
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
