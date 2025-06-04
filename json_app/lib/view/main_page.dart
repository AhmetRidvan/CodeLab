import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_app/models/messages.dart';
import 'package:json_app/models/person_all.dart';
import 'package:json_app/models/persons.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void dontLook() {
    String strVeri =
        '{ "mesajlar" : { "mesaj_kod" : 1,"mesaj_icerik" : "başarılı"  } }';

    final jsonData = jsonDecode(strVeri);

    final map = jsonData['mesajlar'];
    Messages x = Messages.fromJson(map);
    print(x.mesaj_icerik);
    print(x.mesaj_kod);
  }

  void dontLook2() {
    String strVeri =
        '{"kisiler":[{"kisi_id":"1","kisi_ad":"Ahmet","kisi_tel":"12312312"},'
        '{"kisi_id":"2","kisi_ad":"Mehmet","kisi_tel":"912318212"}]}';

    final dart = jsonDecode(strVeri);
    final kisiler = dart['kisiler'] as List;
    List<Person> listem = kisiler.map((e) {
      return Person.fromJson(e);
    }).toList();

    for (final x in listem) {
      print(x.kisi_id);
      print(x.kisi_ad);
      print(x.kisi_tel);
    }
  }

  void x() {
    String strVeri =
        '{"success":1,"kisiler":[{"kisi_id":"1","kisi_ad":"Ahmet","kisi_tel":"12312312"},'
        '{"kisi_id":"2","kisi_ad":"Mehmet","kisi_tel":"912318212"}]}';

    final dart = jsonDecode(strVeri);

    var KisilerCevap = PersonAll.fromJson(dart);

    print(KisilerCevap.success);
    List<Person> list = KisilerCevap.kisiler;

    for (var x in list) {
      print(x.kisi_ad);
    }
  }

  @override
  void initState() {
    super.initState();
    x();
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
