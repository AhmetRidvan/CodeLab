import 'package:flutter/material.dart';
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

  @override
  void initState() {
    count('Mehmet');
    call();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
