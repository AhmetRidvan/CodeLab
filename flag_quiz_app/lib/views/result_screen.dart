import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({super.key, required this.correctNumber});

  int correctNumber;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Result')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(33),
                border: Border.all(color: Colors.pink),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  textAlign: TextAlign.center,
                  'Correct ${widget.correctNumber}\nWrong ${5 - widget.correctNumber}',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Text(
              '% ${((widget.correctNumber * 100) / 5).toInt()} Success',
              style: TextStyle(fontSize: 30, color: Colors.pink),
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Try again!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
