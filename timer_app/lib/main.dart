import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Timer t;
  int leftTime = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Remaining $leftTime time'),
            ElevatedButton(
              onPressed: () {
                t = Timer.periodic(Duration(seconds: 1), (timer) {
                  setState(() {
                    if (leftTime >= 1) {
                      leftTime--;
                    } else {
                      leftTime = 10;
                      t.cancel();
                    }
                  });
                });
              },
              child: Text('Start'),
            ),
          ],
        ),
      ),
    );
  }
}
