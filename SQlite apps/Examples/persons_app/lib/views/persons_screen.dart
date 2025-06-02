import 'package:flutter/material.dart';
import 'package:persons_app/models/person_model.dart';
import 'package:persons_app/views/persons_dao.dart';
import 'package:persons_app/views/persons_detail_screen.dart';
import 'package:persons_app/views/persons_record_screen.dart';

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

    list = await PersonsDao.bringThemAll();
    return list;
  }

  Future<List<PersonModel>> search(String word) async {
    var list = <PersonModel>[];

    list = await PersonsDao.search(word);
    return list;
  }

  Future<void> delete(int person_id) async {
    await PersonsDao.delete(person_id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching
            ? TextField(
                decoration: InputDecoration(hintText: 'Write something'),
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                    print(searchText);
                  });
                },
              )
            : Text('Persons'),
        actions: [
          isSearching
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isSearching = false;
                      searchText = '';
                    });
                  },
                  icon: Icon(Icons.close),
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isSearching = true;
                    });
                  },
                  icon: Icon(Icons.search),
                ),
        ],
      ),
      body: PopScope(
        canPop: false,
        child: FutureBuilder(
          future: isSearching ? search(searchText) : bringThemAll(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final items = snapshot.data;
              return ListView.builder(
                itemCount: items!.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(
                            MaterialPageRoute(
                              builder: (context) {
                                return PersonsDetailScreen(p1: item);
                              },
                            ),
                          )
                          .then((value) {
                            setState(() {});
                          });
                    },
                    child: SizedBox(
                      height: 70,
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.center,
                                item.person_name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                item.person_number,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                onPressed: () {
                                  delete(item.person_id);
                                },
                                icon: Icon(Icons.delete),
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
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) {
                    return PersonsRecord();
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
