import 'package:flutter/material.dart';
import 'package:notes_app/dao.dart';
import 'package:notes_app/views/note_screen.dart';

class NoteRecordScreen extends StatefulWidget {
  const NoteRecordScreen({super.key});

  @override
  State<NoteRecordScreen> createState() => _Record();
}

class _Record extends State<NoteRecordScreen> {
  final lessonName = TextEditingController();
  final grade1 = TextEditingController();
  final grade2 = TextEditingController();

  Future<void> save(String lessonName, int grade1, int grade2) async {
    await NoteDao.add(lessonName, grade1, grade2);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note record'),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                decoration: InputDecoration(hintText: 'Lesson name'),
                controller: lessonName,
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Grade 1'),
                controller: grade1,
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Grade 2'),
                controller: grade2,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        onPressed: () {
          save(lessonName.text, int.parse(grade1.text), int.parse(grade2.text));
        },
        tooltip: 'Save',
        label: Text('Save'),
        icon: Icon(Icons.save),
      ),
    );
  }
}
