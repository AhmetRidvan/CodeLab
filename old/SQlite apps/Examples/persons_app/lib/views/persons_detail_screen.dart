import 'package:flutter/material.dart';
import 'package:persons_app/models/person_model.dart';
import 'package:persons_app/views/persons_dao.dart';

class PersonsDetailScreen extends StatefulWidget {
  PersonsDetailScreen({super.key, required this.p1});

  PersonModel p1;

  @override
  State<PersonsDetailScreen> createState() => _PersonsRecordState();
}

class _PersonsRecordState extends State<PersonsDetailScreen> {
  final cPersonName = TextEditingController();
  final cPersonPhone = TextEditingController();

  Future<void> upgrade(
    int person_id,
    String person_name,
    String person_number,
  ) async {
    await PersonsDao.upgrade(person_id, person_name, person_number);
    Navigator.pop(context);
  }

  @override
  void initState() {
    cPersonName.text = widget.p1.person_name;
    cPersonPhone.text = widget.p1.person_number;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details')),
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
          final item = widget.p1;
          upgrade(item.person_id, cPersonName.text, cPersonPhone.text);
        },
        label: Text('Upgrade'),
        icon: Icon(Icons.upgrade),
      ),
    );
  }
}
