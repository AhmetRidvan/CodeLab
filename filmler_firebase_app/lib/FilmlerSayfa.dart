import 'package:filmler_firebase_app/DetaySayfa.dart';
import 'package:filmler_firebase_app/Filmler.dart';
import 'package:filmler_firebase_app/Kategoriler.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';

class FilmlerSayfa extends StatefulWidget {
  Kategoriler kategori;

  FilmlerSayfa({required this.kategori});

  @override
  _FilmlerSayfaState createState() => _FilmlerSayfaState();
}

class _FilmlerSayfaState extends State<FilmlerSayfa> {
  final r = FirebaseDatabase.instance.ref('filmler');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filmler : ${widget.kategori.kategori_ad}")),
      body: StreamBuilder(
        stream: r
            .orderByChild('kategori_ad')
            .equalTo(widget.kategori.kategori_ad)
            .onValue,
        builder: (context, x) {
          if (x.hasData) {
            var data = x.data!.snapshot.value as Map;
            List<Filmler> filmlerListesi = [];

            data.forEach((key, value) {
              filmlerListesi.add(
                Filmler.fromJson(key, Map<String, dynamic>.from(value)),
              );
            });

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3.5,
              ),
              itemCount: filmlerListesi.length,
              itemBuilder: (context, indeks) {
                var film = filmlerListesi[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetaySayfa(film: film),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network('http://kasimadalan.pe.hu/filmler/resimler/${film.film_resim}'),
                        ),
                        Text(
                          film.film_ad,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center();
          }
        },
      ),
    );
  }
}
