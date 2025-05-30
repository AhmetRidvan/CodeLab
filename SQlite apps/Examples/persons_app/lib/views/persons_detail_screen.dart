import 'package:flutter/material.dart';

class PersonsDetailScreen extends StatefulWidget {
  const PersonsDetailScreen({super.key});

  @override
  State<PersonsDetailScreen> createState() => _PersonsRecordState();
}

class _PersonsRecordState extends State<PersonsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.details),
      ),
    );
  }
}
