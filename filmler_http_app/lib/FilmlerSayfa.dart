import 'dart:convert';

import 'package:filmler_http_app/DetaySayfa.dart';
import 'package:filmler_http_app/Filmler.dart';
import 'package:filmler_http_app/FilmlerCevap.dart';
import 'package:filmler_http_app/Kategoriler.dart';
import 'package:filmler_http_app/Yonetmenler.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FilmlerSayfa extends StatefulWidget {
  Kategoriler kategori;

  FilmlerSayfa({required this.kategori});

  @override
  _FilmlerSayfaState createState() => _FilmlerSayfaState();
}

class _FilmlerSayfaState extends State<FilmlerSayfa> {
  List<Filmler> parseFilmler(String body) {
    return Filmlercevap.fromJson(jsonDecode(body)).list;
  }

  Future<List<Filmler>> filmleriGoster(int kategori_id) async {
    final url = Uri.parse(
      'http://kasimadalan.pe.hu/filmler/filmler_by_kategori_id.php',
    );

    Map<String, dynamic> m = {'kategori_id': kategori_id .toString()};

    final x = await http.post(url, body: m);

    return parseFilmler(x.body);
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
