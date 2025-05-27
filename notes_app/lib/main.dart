import 'package:flutter/material.dart';
import 'package:notes_app/views/note_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellowAccent),
      ),
      home: const NoteScreen(), //51:44
    );
  }
}
