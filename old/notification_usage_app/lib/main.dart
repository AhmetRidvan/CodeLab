import 'package:flutter/material.dart';
import 'package:notification_usage_app/views/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellowAccent),
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(), // birdaha oku notication
    );
  }
}
