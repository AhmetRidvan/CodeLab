import 'package:flutter/material.dart';
import 'package:kisiler_http_app/main.dart';
import 'package:http/http.dart' as http;

class KisiKayitSayfa extends StatefulWidget {
  @override
  _KisiKayitSayfaState createState() => _KisiKayitSayfaState();
}

class _KisiKayitSayfaState extends State<KisiKayitSayfa> {
  var tfKisiAdi = TextEditingController();
  var tfKisiTel = TextEditingController();

  Future<void> kayit(String kisi_ad, String kisi_tel) async {
    final url = Uri.parse('http://kasimadalan.pe.hu/kisiler/insert_kisiler.php');
    final data = {'kisi_ad': kisi_ad, 'kisi_tel': kisi_tel};
    await http.post(url,body: data);
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
