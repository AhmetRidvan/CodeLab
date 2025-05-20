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
    await PersonDao.addPerson('Zeynep', 20);
  }

  @override
  void initState() {
    add();
    call();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
