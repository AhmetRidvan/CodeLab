import 'package:flutter/material.dart';
import 'package:notes_app/dao.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/views/note_detail_screen.dart';
import 'package:notes_app/views/note_record_screen.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  Future<List<NoteModel>> showAllNotes() async {
    final list = <NoteModel>[];
    list.addAll(await NoteDao.bringThemAll());

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Notes app', style: TextStyle(fontSize: 16)),
            FutureBuilder(
              future: showAllNotes(),
              builder: (context, snapshot) {
                final items = snapshot.data;

                if (snapshot.hasData) {
                  double ortalama = 0;

                  for (final x in items!) {
                    ortalama = ortalama + ((x.grade1 + x.grade2) / 2);
                  }

                  ortalama = ortalama / items.length;
                  return Text(ortalama.round().toString());
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
      body: PopScope(
        canPop: false,
        child: FutureBuilder(
          future: showAllNotes(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var items = snapshot.data;
              return ListView.builder(
                itemCount: items!.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return NoteDetailScreen(n1: item);
                          },
                        ),
                      ).then((value) {
                        setState(() {
                          
                        });
                      },);
                    },
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(333),
                      ),
                      child: Card(
                        color: Theme.of(context).colorScheme.onPrimary,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.center,
                                item.lesson_name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.center,
                                item.grade1.toString(),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.center,
                                item.grade2.toString(),
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) {
                    return NoteRecordScreen();
                  },
                ),
              )
              .then((value) {
                setState(() {});
              });
        },
        tooltip: 'Add note',
        child: const Icon(Icons.add),
      ),
    );
  }
}
