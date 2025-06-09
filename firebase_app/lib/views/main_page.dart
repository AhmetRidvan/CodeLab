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
    map['kisi_ad'] = 'Selam huu';
    map['kisi_yas'] = 23;
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
      final data = event.snapshot.value as Map;

      data.forEach((key, value) {
        final object = KisiModel.fromJson(Map<String, dynamic>.from(value));
        print('----');
        print(object.kisi_ad);
        print(object.kisi_yas);
        print(key.toString());
      });
    });
  }

  Future<void> once() async {
    refPersons.once().then((value) {
      final incomingValue = value.snapshot.value as Map;

      incomingValue.forEach((key, value1) {
        final object = KisiModel.fromJson(Map<String, dynamic>.from(value1));
        print(object.kisi_ad);
        print(object.kisi_yas);
      });
    });
  }

  Future<void> search() async {
    final Query = refPersons.orderByChild('kisi_yas').equalTo(23);

    Query.onValue.listen((event) {
      final data = event.snapshot.value as dynamic;
      print(data);

      if (data != null) {
        data.forEach((key, value) {
          final object = KisiModel.fromJson(Map<String, dynamic>.from(value));
          print('----');
          print(object.kisi_ad);
          print(object.kisi_yas);
          print(key.toString());
        });
      } else {
        print('Nothing here');
      }
    });
  }

  Future<void> limit() async {
    final query = refPersons.limitToLast(3);

    query.onValue.listen((event) {
      final data = event.snapshot.value as Map;

      data.forEach((key, value) {
        final model = KisiModel.fromJson(Map<String, dynamic>.from(value));
        print(model.kisi_ad);
        print(model.kisi_yas);
      });
    });
  }

  Future<void> valueRange() async {
    final query = refPersons.orderByChild('kisi_yas').startAt(10).endAt(25);

    query.onValue.listen((event) {
      final data = event.snapshot.value as Map;

      data.forEach((key, value) {
        final model = KisiModel.fromJson(Map<String, dynamic>.from(value));
        print(model.kisi_ad);
        print(model.kisi_yas);
      });
    });
  }

  @override
  void initState() {
    valueRange();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
