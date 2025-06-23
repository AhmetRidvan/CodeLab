import 'package:flutter/material.dart';
import 'package:notes_app/dao.dart';
import 'package:notes_app/model/note_model.dart';

class NoteDetailScreen extends StatefulWidget {
  NoteDetailScreen({super.key, required this.n1});
  NoteModel n1;
  @override
  State<NoteDetailScreen> createState() => _Detail();
}

class _Detail extends State<NoteDetailScreen> {
  final lessonName = TextEditingController();
  final grade1 = TextEditingController();
  final grade2 = TextEditingController();

  @override
  void initState() {
    lessonName.text = widget.n1.lesson_name;
    grade1.text = widget.n1.grade1.toString();
    grade2.text = widget.n1.grade2.toString();
    super.initState();
  }

  Future<void> delete(int note_id) async {
    await NoteDao.delete(note_id);
    Navigator.of(context).pop();
  }

  Future<void> upgrade(
    int note_id,
    String lesson_name,
    int grade1,
    int grade2,
  ) async {
    await NoteDao.upgrade(note_id, lesson_name, grade1, grade2);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              delete(widget.n1.note_id);
            },
            icon: Icon(Icons.delete),
          ),
          IconButton(
            onPressed: () {
              var x = widget.n1;
              upgrade(
                x.note_id,
                lessonName.text,
                int.parse(grade1.text),
                int.parse(grade2.text),
              );
              print(
                '${lessonName.text} ${int.parse(grade1.text)} ${int.parse(grade2.text)}',
              );
            },
            icon: Icon(Icons.upgrade),
          ),
        ],
        title: Text('Note Detail'),
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
    );
  }
}
