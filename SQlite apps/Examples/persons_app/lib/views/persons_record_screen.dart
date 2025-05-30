import 'package:flutter/material.dart';

class PersonsRecord extends StatefulWidget {
  const PersonsRecord({super.key});

  @override
  State<PersonsRecord> createState() => _PersonsRecordState();
}

class _PersonsRecordState extends State<PersonsRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Record'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.save),
      ),
    );
  }
}
