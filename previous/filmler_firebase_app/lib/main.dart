import 'package:filmler_firebase_app/FilmlerSayfa.dart';
import 'package:filmler_firebase_app/Kategoriler.dart';
import 'package:filmler_firebase_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
  final r = FirebaseDatabase.instance.ref('kategoriler');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kategoriler")),
      body: StreamBuilder(
        stream: r.onValue,
        builder: (context, x) {
          if (x.hasData) {
            var data = x.data!.snapshot.value as Map;
            List<Kategoriler> kategoriListesi = [];

            data.forEach((key, value) {
              
              kategoriListesi.add(
                Kategoriler.fromJson(key, Map<String, dynamic>.from(value)),
              );
            });

            return ListView.builder(
              itemCount: kategoriListesi.length,
              itemBuilder: (context, indeks) {
                var kategori = kategoriListesi[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FilmlerSayfa(kategori: kategori),
                      ),
                    );
                  },
                  child: Card(
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text(kategori.kategori_ad)],
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
    );
  }
}
