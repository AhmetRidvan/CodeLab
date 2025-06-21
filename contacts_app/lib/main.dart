import 'package:contacts_app/model/person_model.dart';
import 'package:contacts_app/views/details_page.dart';
import 'package:contacts_app/views/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); //9:05
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
      ),
      home: MainPage()
    );
  }
}
