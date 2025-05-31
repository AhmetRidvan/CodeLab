import 'package:flutter/material.dart';
import 'package:persons_app/models/person_model.dart';

class PersonsRecord extends StatefulWidget {
  PersonsRecord({super.key});

  

  @override
  State<PersonsRecord> createState() => _PersonsRecordState();
}

class _PersonsRecordState extends State<PersonsRecord> {
  final cPersonName = TextEditingController();
  final cPersonPhone = TextEditingController();

  Future<void> record(String person_name, String person_number) async {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Record')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: cPersonName,
                decoration: InputDecoration(hintText: 'Person name'),
              ),
              TextField(
                controller: cPersonPhone,
                decoration: InputDecoration(hintText: 'Person phone'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          record(cPersonName.text, cPersonPhone.text);
        },
        icon: Icon(Icons.save),
        label: Text('Save'),
      ),
    );
  }
}
