import 'dart:async';
import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:notes_app/model/noteModel.dart';
import 'package:notes_app/views/notes_details.dart';
import 'package:notes_app/views/notes_record.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  final ref = FirebaseDatabase.instance.ref('notlar');
@override
  void initState() {
     ref.onValue.listen((event) {
      print('change ${event.snapshot.value}');
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Notes app', style: TextStyle(fontSize: 16)),
            StreamBuilder(
              stream: ref.onValue,

              builder: (context, event) {
                if (event.hasData) {
                  final data = <Notemodel>[];
                  final incomingValues = event.data!.snapshot.value as Map;
                  print(incomingValues);
                  print('İncoming value $incomingValues');
                  incomingValues.forEach((key, value) {
                    data.add(
                      Notemodel.fromJson(key, Map<String, dynamic>.from(value)),
                    );
                  });
                  if (data.isNotEmpty) {
                    double total = 0.0;
                    double result = 0.0;

                    for (final x in data) {
                      total = total + ((x.grade1 + x.grade2) / 2);
                    }
                    result = total / data.length;

                    return Text(
                      result.toInt().toString(),

                      style: TextStyle(fontSize: 16),
                    );
                  } else {
                    return Text('Average : 0', style: TextStyle(fontSize: 16));
                  }
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: StreamBuilder(
        stream: ref.onValue,

        builder: (context, event) {
          if (event.hasData) {
            var data = event.data!.snapshot.value as Map;
            List<Notemodel> list = [];
            data.forEach((key, value) {
              list.add(
                Notemodel.fromJson(key, Map<String, dynamic>.from(value)),
              );
            });

            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                final note = list[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(
                          MaterialPageRoute(
                            builder: (context) {
                              return NotesDetails(n1: note);
                            },
                          ),
                        )
                        .then((value) {
                          setState(() {});
                        });
                  },
                  child: SizedBox(
                    height: 60,
                    child: Card(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              note.lesson_name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              note.grade1.toString(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              note.grade2.toString(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) {
                    return NotesRecord();
                  },
                ),
              )
              .then((value) {
                setState(() {});
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
