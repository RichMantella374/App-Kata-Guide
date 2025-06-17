import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:app_kata/pages/pages_karate_tapes/videos/belt_videos.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});
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
                  "Cinta morada",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Text("6° kyu", style: TextStyle(fontSize: 14)),
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
              "La cinta morada marca el primer destello de transformación. Las técnicas ya no son movimientos aislados, sino semillas de estrategia. El cuerpo aprende a fluir, la mente empieza a ver más allá del golpe. El camino se inclina, pero tu determinación se fortalece.",
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
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos/morada/heisoku.jpeg",
                        width: 200,
                        height: 200,
                      ),
                      Text("Heisoku Dachi", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Image.network(
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos/morada/sikiod.png",
                        width: 200,
                        height: 200,
                      ),
                      Text("Sikio dachi", style: TextStyle(fontSize: 16)),
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
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos/morada/sanchind.png",
                        width: 200,
                        height: 200,
                      ),
                      Text("Sanchin dachi", style: TextStyle(fontSize: 16)),
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
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos/morada/moroteg.png",
                        width: 200,
                        height: 200,
                      ),
                      Text("Morote uke", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Image.network(
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos/morada/morote.png",
                        width: 200,
                        height: 200,
                      ),
                      Text("Shuto uke", style: TextStyle(fontSize: 16)),
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
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos/morada/yuyi.png",
                        width: 200,
                        height: 200,
                      ),
                      Text("Yuyi uke", style: TextStyle(fontSize: 16)),
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
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos/morada/empi.png",
                        width: 200,
                        height: 200,
                      ),
                      Text("Empi", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Image.network(
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos/morada/urake.png",
                        width: 200,
                        height: 200,
                      ),
                      Text("Uraken", style: TextStyle(fontSize: 16)),
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
                        BeltVideos.allVideos['morado']?['video1'] ?? '',
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
