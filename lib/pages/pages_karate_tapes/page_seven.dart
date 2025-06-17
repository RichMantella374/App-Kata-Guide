import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:app_kata/pages/pages_karate_tapes/videos/belt_videos.dart';

class PageSeven extends StatelessWidget {
  const PageSeven({super.key});

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
                Text("1° kyu", style: TextStyle(fontSize: 14)),
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
              "Tierra fértil lista para dar fruto. La cinta café lleva la huella de años de sudor. Tus golpes tienen el peso de la experiencia, tus formas, la elegancia de lo esencial. Ahora eres puente entre generaciones, guardián de la tradición viva.",
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
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos/cafe/Nainfachi%20dachi.png",
                        width: 200,
                        height: 200,
                      ),
                      Text("Naifanchin Dachi", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ],
            ),
            
            //-------------------------------------------------------
            

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
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos/cafe/econo%20geri%20log.png",
                        width: 200,
                        height: 200,
                      ),
                      Text("Econo geri", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Image.network(
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos/cafe/kaji%20tsuki%20log.png",
                        width: 200,
                        height: 200,
                      ),
                      Text("Kaji tsuki", style: TextStyle(fontSize: 16)),
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
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos/cafe/kekomi%20geri%20log.png",
                        width: 200,
                        height: 200,
                      ),
                      Text("Kekomi geri", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ],
            ),



Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 25,
            ),
            Text(
              "Conocimientos Necesarios.",
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
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos/cafe/romipimintos%20de%20tabla.png",
                        width: 200,
                        height: 200,
                      ),
                      Text("Rompimientos de tabla", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Image.network(
                        "https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cosos/cafe/uso%20de%20nunchacus.png",
                        width: 200,
                        height: 200,
                      ),
                      Text("Uso de nunchakus", style: TextStyle(fontSize: 16)),
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
                        BeltVideos.allVideos['cafe']?['video1'] ?? '',
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
                  '/video?beltId=blanca&sectionId=video1&videoId=${BeltVideos.allVideos['cafe']?['video1'] ?? ''}',
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
