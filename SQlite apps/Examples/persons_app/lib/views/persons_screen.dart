import 'package:flutter/material.dart';
import 'package:persons_app/models/person_model.dart';

class PersonsScreen extends StatefulWidget {
  const PersonsScreen({super.key});

  @override
  State<PersonsScreen> createState() => _PersonsScreenState();
}

class _PersonsScreenState extends State<PersonsScreen> {
  bool isSearching = false;
  String searchText = '';

  Future<List<PersonModel>> bringThemAll() async {
    var list = <PersonModel>[];

    PersonModel p1 = PersonModel(
      person_id: 1,
      person_name: 'Zeynep',
      person_number: '5415385744',
    );
    PersonModel p2 = PersonModel(
      person_id: 2,
      person_name: 'Alnaz',
      person_number: '5414253244',
    );
    PersonModel p3 = PersonModel(
      person_id: 3,
      person_name: 'Michele',
      person_number: '5134143114',
    );

    list.addAll([p1, p2, p3]);
    return list;
  }

  Future<void> delete(int person_id) async {
    print('$person_id deleted'); 
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Persons')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
