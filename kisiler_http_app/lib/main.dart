import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kisiler_http_app/KisiDetaySayfa.dart';
import 'package:kisiler_http_app/KisiKayitSayfa.dart';
import 'package:kisiler_http_app/Kisiler.dart';
import 'package:http/http.dart' as http;
import 'package:kisiler_http_app/kisilerCevap.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;
  String aramaKelimesi = "";

  List<Kisiler> parseKisiler(String body) {
    return KisilerCevap.jsonParse(jsonDecode(body)).list;
  }

  Future<List<Kisiler>> tumKisileriGoster() async {
    final url = Uri.parse('http://kasimadalan.pe.hu/kisiler/tum_kisiler.php');
    final x = await http.get(url);
    return parseKisiler(x.body);
  }

  Future<List<Kisiler>> search(String aramaKelimesi) async {
    final url = Uri.parse(
      'http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php',
    );

    Map<String, dynamic> mapa = {'kisi_ad': aramaKelimesi};
    final x = await http.post(url, body: mapa);
    return parseKisiler(x.body);
  }

  Future<void> sil(int kisi_id) async {
    final url = Uri.parse(
      'http://kasimadalan.pe.hu/kisiler/delete_kisiler.php',
    );
    final map = {'kisi_id': kisi_id.toString()};
    final x = await http.post(url, body: map);
    print(x.body);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu
            ? TextField(
                decoration: InputDecoration(
                  hintText: "Arama için birşey yazın",
                ),
                onChanged: (aramaSonucu) {
                  print("Arama sonucu : $aramaSonucu");
                  setState(() {
                    aramaKelimesi = aramaSonucu;
                  });
                },
              )
            : Text("Kişiler Uygulaması"),
        actions: [
          aramaYapiliyorMu
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      aramaYapiliyorMu = false;
                      aramaKelimesi = "";
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      aramaYapiliyorMu = true;
                    });
                  },
                ),
        ],
      ),
      body: PopScope(
        canPop: false,
        child: FutureBuilder<List<Kisiler>>(
          future: aramaYapiliyorMu
              ? search(aramaKelimesi)
              : tumKisileriGoster(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var kisilerListesi = snapshot.data;
              return ListView.builder(
                itemCount: kisilerListesi!.length,
                itemBuilder: (context, indeks) {
                  var kisi = kisilerListesi[indeks];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => KisiDetaySayfa(kisi: kisi),
                        ),
                      );
                    },
                    child: Card(
                      child: SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.center,
                                kisi.kisi_ad,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                kisi.kisi_tel,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                icon: Icon(Icons.delete, color: Colors.black54),
                                onPressed: () {
                                  sil(int.parse(kisi.kisi_id));
                                },
                              ),
                            ),
                          ],
                        ),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => KisiKayitSayfa()),
          );
        },
        tooltip: 'Kişi Ekle',
        child: Icon(Icons.add),
      ),
    );
  }
}
