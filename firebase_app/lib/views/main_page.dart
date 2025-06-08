import 'package:firebase_app/models/kisi_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final refPersons = FirebaseDatabase.instance.ref().child('Test tablosu');

  Future<void> addPerson() async {
    Map<String, dynamic> map = {};
    map['kisi_ad'] = 'Michelle';
    map['kisi_yas'] = 15;
    refPersons.push().set(map);
  }

  Future<void> deletePerson() async {
    refPersons.child('-OSFCsdp22UUyRT8KAwt').remove();
  }

  Future<void> upgradePerson() async {
    Map<String, dynamic> map = {'kisi_ad': 'Yeni Samet', 'kisi_yas': 23};
    refPersons.child('-OSFDC5lxVAyZz4kAreD').update(map);
  }

  Future<void> allPersons() async {
    refPersons.onValue.listen((event) {
      final data = event.snapshot.value as dynamic;

      data.forEach((key, value) {
        final object = KisiModel.fromJson(Map<String,dynamic>.from(value));
        print('----');
        print(object.kisi_ad);
        print(object.kisi_yas);
        print(key.toString());
      });
    });
  }



  @override
  void initState() {
    allPersons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
