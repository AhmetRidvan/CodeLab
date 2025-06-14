import 'package:flutter/material.dart';
import 'package:sqlite_usage/models/person_model.dart';
import 'package:sqlite_usage/person_dao.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<void> call() async {
    final list = await PersonDao.allPersons();
    for (final x in list) {
      print(x.person_name);
      print(x.person_id);
      print(x.person_age);
    }
  }

  Future<void> add() async {
    await PersonDao.addPerson('samet', 11);
  }

  Future<void> delete(int id) async {
    await PersonDao.delete(id);
  }

  Future<void> update(String name, int sayi, int id) async {
    await PersonDao.upgrade(name, sayi, id);
  }

  Future<void> count(String name) async {
    final x = await PersonDao.count(name);

    print(x); //3:07
  }

  Future<void> bringOne(int id) async {
    PersonModel x = await PersonDao.bringOne(id);
    print('xxxx');
    print(x.person_name);
    print(x.person_id);
    print(x.person_age);
    print('xxxx');
  }

  Future<void> searchByName(String name) async {
    List<PersonModel> x = await PersonDao.searchByName(name);
    for (final items in x) {
      print('Merhaba ${items.person_id}');
    }
  }

  Future<void> random() async {
    List<PersonModel> x = await PersonDao.random();
    for (final items in x) {
      print('Merhaba ${items.person_name}');
    }
  }

  @override
  void initState() {
    random();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
