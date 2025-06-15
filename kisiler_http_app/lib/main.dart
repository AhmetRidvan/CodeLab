import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kisiler_http_app/KisiDetaySayfa.dart';
import 'package:kisiler_http_app/KisiKayitSayfa.dart';
import 'package:kisiler_http_app/Kisiler.dart';

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

  Future<List<Kisiler>> tumKisileriGoster() async {
    var kisilerListesi = <Kisiler>[];

    return kisilerListesi;
  }

  Future<void> sil(int kisi_id) async {
    print("$kisi_id silindi");
    setState(() {});
  }

  Future<bool> uygulamayiKapat() async {
    await exit(0);
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
          future: tumKisileriGoster(),
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
                            Text(
                              kisi.kisi_ad,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(kisi.kisi_tel),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.black54),
                              onPressed: () {
                                sil(kisi.kisi_id);
                              },
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
