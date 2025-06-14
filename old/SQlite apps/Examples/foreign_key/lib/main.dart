import 'package:flutter/material.dart';
import 'package:foreign_key/filmlerdao.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> show() async {
    final list = await Filmlerdao.tumFilmler();
    for (final x in list) {
      print(x.film_ad);
      print('***');
      print(x.kategoriler.kategori_ad);
      print('***');
      print(x.yonetmenler.yonetmen_ad);
    }
  }

  @override
  void initState() {
    show();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: const Center(child: Text('Hello World'))),
    );
  }
}
