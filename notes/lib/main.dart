import 'package:flutter/material.dart';
import 'package:notes/views/notes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // https://www.youtube.com/watch?v=pf9d1Vgsh1U&t=3073s
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
      ),
      debugShowCheckedModeBanner: false,
      home: Notes(),
    );
  }
}                                                                                                                                                            