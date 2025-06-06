import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:json_app2/models/answer_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    movie();
  }

  void movie() {
    String strVeri =
        '{"success":1,"filmler":[{"film_id":"1","film_ad":"Interstellar"'
        ',"film_yil":"2015","film_resim":"interstellar.png",'
        '"kategori":{"kategori_id":"4","kategori_ad":"Bilim Kurgu"},'
        '"yonetmen":{"yonetmen_id":"1","yonetmen_ad":"Christopher Nolan"}},'
        '{"film_id":"3","film_ad":"The Pianist","film_yil":"2002","film_resim":"thepianist.png",'
        '"kategori":{"kategori_id":"3","kategori_ad":"Drama"},'
        '"yonetmen":{"yonetmen_id":"4","yonetmen_ad":"Roman Polanski"}}]}';

    var json = jsonDecode(strVeri);
    final data = AnswerModel.fromJson(json);
    int success = data.success;
    for (final x in data.movieList) {
      print(x.movie_name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
