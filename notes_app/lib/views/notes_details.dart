import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:notes_app/model/noteModel.dart';

class NotesDetails extends StatefulWidget {
  NotesDetails({super.key, required this.n1});

  Notemodel n1;

  @override
  State<NotesDetails> createState() => _NotesDetailsState();
}

class _NotesDetailsState extends State<NotesDetails> {
  final tLessonName = TextEditingController();
  final tGrade1 = TextEditingController();
  final tGrade2 = TextEditingController();

  Future<void> upgrade(
    String note_id,
    String className,
    int grade1,
    int grade2,
  ) async {
    final referance = FirebaseDatabase.instance.ref('notlar');
    final map = {
      'ders_adi': className,
      'not1': grade1,
      'not2': grade2,
      'not_id': '',
    };
    referance.child(widget.n1.note_id).update(map);
    Navigator.of(context).pop();
  }

  Future<void> delete(String note_id) async {
    final referance = FirebaseDatabase.instance.ref('notlar');
    await referance.child(note_id).remove();
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    tLessonName.text = widget.n1.lesson_name;
    tGrade1.text = widget.n1.grade1.toString();
    tGrade2.text = widget.n1.grade2.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              delete(widget.n1.note_id);
            },
            child: Text('Delete', style: TextStyle()),
          ),
          TextButton(
            onPressed: () {
              final n = widget.n1;
              upgrade(
                n.note_id,
                tLessonName.text,
                int.parse(tGrade1.text),
                int.parse(tGrade2.text),
              );
            },
            child: Text('Update', style: TextStyle()),
          ),
        ],
        title: Text('Note details'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tLessonName,
                decoration: InputDecoration(hintText: 'Lesson name'),
              ),
              TextField(
                controller: tGrade1,
                decoration: InputDecoration(hintText: 'Grade 1'),
              ),
              TextField(
                controller: tGrade2,
                decoration: InputDecoration(hintText: 'Grade 2'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
