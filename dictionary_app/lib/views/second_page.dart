import 'package:dictionary_app/model/word_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SecondPage extends StatefulWidget {
  SecondPage({super.key, required this.w1});

  WordModel w1;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              textAlign: TextAlign.center,
              widget.w1.english,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 45,
                color: Colors.pinkAccent,
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              widget.w1.turkish,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}
