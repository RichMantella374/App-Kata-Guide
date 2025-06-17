import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class PageEight extends StatelessWidget {
  const PageEight({super.key});

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
                  "Cinta Negra",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Text("1° Dan", style: TextStyle(fontSize: 14)),
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
              "El negro no es el final, sino el abismo de posibilidades donde todo recomienza. Aquí, cada técnica alcanza la perfección tallada en años de fuego y paciencia: los golpes no son sólo rápidos, sino impecables; las katas ya no son formas, sino enciclopedias de combate donde cada movimiento revela su bunkai oculto, desentrañando secretos que sólo los dignos pueden comprender. Tu cuerpo, esculpido por el tiempo, posee una condición física excelsa: resistencia que desafía montañas, explosividad que rivaliza con el rayo. Conoces los puntos vitales como un cirujano conoce la anatomía, y tu vocabulario técnico fluye con la precisión de un antiguo sensei. El kumite ya no es lucha, sino diálogo estratégico, un ajedrez de músculo y mente. Y en la cúspide, la tesina: un tratado de 30 cuartillas, forjado bajo la guía del maestro, donde fotos, diagramas y palabras eternizan tu legado. Eres ahora custodio del arte, un puente entre el pasado y el futuro, donde cada enseñanza lleva el sello de tu nombre.",
              style: TextStyle(fontSize: 13),
              textAlign: TextAlign.justify,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 25,
            ),
            
            //-------------------------------------------------------
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
                      Text("Exibición con nunchakus", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ],
            ),
            //Video de la cinta blanca
          ],
        ),
      ),
    );
  }
}
