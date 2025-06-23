import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kisiler_http_app/main.dart';

class KisiKayitSayfa extends StatefulWidget {
  @override
  _KisiKayitSayfaState createState() => _KisiKayitSayfaState();
}

class _KisiKayitSayfaState extends State<KisiKayitSayfa> {
  var tfKisiAdi = TextEditingController();
  var tfKisiTel = TextEditingController();
  final r = FirebaseDatabase.instance.ref('kisiler');

  Future<void> kayit(String kisi_ad, String kisi_tel) async {
    final map = {
      'kisi_ad' : kisi_ad,'kisi_id' : '',
      'kisi_tel' : kisi_tel,
    };
    r.push().set(map);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Anasayfa()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kişi Kayıt")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextField(
                controller: tfKisiAdi,
                decoration: InputDecoration(hintText: "Kişi Ad"),
              ),
              TextField(
                controller: tfKisiTel,
                decoration: InputDecoration(hintText: "Kişi Tel"),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          kayit(tfKisiAdi.text, tfKisiTel.text);
        },
        tooltip: 'Kişi Kayıt',
        icon: Icon(Icons.save),
        label: Text("Kaydet"),
      ),
    );
  }
}
