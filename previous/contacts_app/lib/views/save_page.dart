import 'package:contacts_app/cubit/person_save_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavePage extends StatefulWidget {
  const SavePage({super.key});

  @override
  State<SavePage> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  final tName = TextEditingController();
  final tNumber = TextEditingController();

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
                  context.read<PersonSaveCubit>().save(
                    tName.text,
                    tNumber.text,
                  );
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
