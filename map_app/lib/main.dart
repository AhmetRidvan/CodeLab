import 'package:flutter/material.dart';
import 'package:map_app/views/main_page.dart';


void main() {
  runApp(const MyApp()); //3:17 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: MainPage(),
    );
  }
}


