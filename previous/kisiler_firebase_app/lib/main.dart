import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kisiler_http_app/KisiDetaySayfa.dart';
import 'package:kisiler_http_app/KisiKayitSayfa.dart';
import 'package:kisiler_http_app/Kisiler.dart';
import 'package:kisiler_http_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp()); //21:55
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
  final r = FirebaseDatabase.instance.ref('kisiler');
  bool aramaYapiliyorMu = false;
  String aramaKelimesi = "";

  Future<void> sil(String kisi_id) async {
    r.child(kisi_id).remove();
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
        child: StreamBuilder(
          stream: r.onValue,
          builder: (context, x) {
            if (x.hasData) {
              var data = x.data!.snapshot.value as Map;
              List<Kisiler> list = [];

              data.forEach((key, value) {
                final object = Kisiler.fromJson(
                  key,
                  Map<String, dynamic>.from(value),
                );

                if (aramaYapiliyorMu) {
                  if (object.kisi_ad.contains(aramaKelimesi)) {
                    list.add(object);
                  }
                } else {
                  list.add(object);
                }
              });
              print(list.length);
              return ListView.builder(
                itemCount: list!.length,
                itemBuilder: (context, indeks) {
                  var kisi = list[indeks];
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
