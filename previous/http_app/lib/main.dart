import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http_app/models/person_all.dart';
import 'package:http_app/models/persons.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Person> parsePersonAll(String answer) {
    return PersonAll.fromJson(jsonDecode(answer)).kisiler;
  }

  Future<List<Person>> allPersons() async {
    final url = Uri.parse('http://kasimadalan.pe.hu/kisiler/tum_kisiler.php');
    final answer = await http.get(url);
    return parsePersonAll(answer.body);
  }

  Future<List<Person>> searchPersons(String name) async {
    final url = Uri.parse(
      'http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php',
    );
    Map<String, dynamic> data = {'kisi_ad': name};
    final answer = await http.post(url, body: data);
    return parsePersonAll(answer.body);
  }

  Future<void> delete(int id) async {
    final url = Uri.parse(
      'http://kasimadalan.pe.hu/kisiler/delete_kisiler.php',
    );
    final map = {'kisi_id': id.toString()};

    final response = await http.post(url, body: map);
    print(response.body);
  }

  Future<void> addPerson(String kisi_ad, String kisi_tel) async {
    final url = Uri.parse(
      'http://kasimadalan.pe.hu/kisiler/insert_kisiler.php',
    );

    Map<String, dynamic> data = {'kisi_ad': kisi_ad, 'kisi_tel': kisi_tel};

    final x = await http.post(url, body: data);
    print(x.body);
  }

  Future<void> showPersons() async {
    final list = await allPersons();
    for (final x in list) {
      print(x.kisi_ad);
      print(x.kisi_tel);
      print(x.kisi_id);
    }
  }

  Future<void> upgrade(int kisi_id, String kisi_adi, String kisi_tel) async {
    final url = Uri.parse(
      'http://kasimadalan.pe.hu/kisiler/update_kisiler.php',
    );

    Map<String, dynamic> map = {
      'kisi_id': kisi_id.toString(),
      'kisi_ad': kisi_adi,
      'kisi_tel': kisi_tel,
    };

    final r = await http.post(url, body: map);
    print(r.body);
        showPersons();
  }

  @override
  void initState() { //initte await farketmez hepsi aynı anda başlatılır.
    upgrade(18935, 'Testadx1111', 'TestTel xxxxx');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
