import 'package:flutter/material.dart';

class SavePage extends StatefulWidget {
  const SavePage({super.key});

  @override
  State<SavePage> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  final tName = TextEditingController();
  final tNumber = TextEditingController();

  Future<void> update(String person_name, String person_number) async {
    print('$person_name $person_number');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tName,
                decoration: InputDecoration(hintText: 'Name'),
              ),
              TextField(
                controller: tNumber,
                decoration: InputDecoration(hintText: 'Number'),
              ),
              ElevatedButton(
                onPressed: () {
                
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Save'),
        backgroundColor: Theme.of(context).colorScheme.primaryFixedDim,
      ),
    );
  }
}
