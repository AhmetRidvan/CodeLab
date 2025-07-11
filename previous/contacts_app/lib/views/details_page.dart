import 'package:contacts_app/cubit/person_update.dart';
import 'package:contacts_app/model/person_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({super.key, required this.p1});

  PersonModel p1;
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final tName = TextEditingController();
  final tNumber = TextEditingController();

  @override
  void initState() {
    tName.text = widget.p1.person_name;
    tNumber.text = widget.p1.person_number;
    super.initState();
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
                  context.read<PersonUpdateCubit>().update(
                    widget.p1.person_id,
                    tName.text,
                    tNumber.text,
                  );
                },
                child: Text('Update'),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Details'),
        backgroundColor: Theme.of(context).colorScheme.primaryFixedDim,
      ),
    );
  }
}
