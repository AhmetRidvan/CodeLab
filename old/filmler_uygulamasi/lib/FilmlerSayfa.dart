import 'dart:convert';

import 'package:filmler_uygulamasi/DetaySayfa.dart';
import 'package:filmler_uygulamasi/models/Filmler.dart';
import 'package:filmler_uygulamasi/models/Filmler_cevap.dart';

import 'package:filmler_uygulamasi/models/Kategoriler.dart';
import 'package:filmler_uygulamasi/models/Yonetmenler.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FilmlerSayfa extends StatefulWidget {
  Kategoriler kategori;

  FilmlerSayfa({required this.kategori});

  @override
  _FilmlerSayfaState createState() => _FilmlerSayfaState();
}

class _FilmlerSayfaState extends State<FilmlerSayfa> {
  Future<List<Filmler>> parseFilmlerCevap(String text) async {
    return FilmlerCevap.fromJson(jsonDecode(text)).list;
  }

  Future<List<Filmler>> filmleriGoster(int kategori_id) async {
    final url = Uri.parse(
      'http://kasimadalan.pe.hu/filmler/filmler_by_kategori_id.php',
    );
    final data = {'kategori_id': kategori_id.toString()};
    final r1 = await http.post(url,body: data);
    return parseFilmlerCevap(r1.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filmler : ${widget.kategori.kategori_ad}")),
      body: FutureBuilder<List<Filmler>>(
        future: filmleriGoster(int.parse(widget.kategori.kategori_id)),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var filmlerListesi = snapshot.data;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3.5,
              ),
              itemCount: filmlerListesi!.length,
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
                          child: Image.network(
                            "http://kasimadalan.pe.hu/filmler/resimler/${film.film_resim}",
                          ),
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
