import 'package:contacts_app/model/person_model.dart';
import 'package:contacts_app/views/details_page.dart';
import 'package:contacts_app/views/save_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isSearching = false;
  String text = '';

  Future<List<PersonModel>> showThemAll() async {
    final list = <PersonModel>[];
    final p1 = PersonModel(
      person_id: 1,
      person_name: 'Samet',
      person_number: '2456764543',
    );
    final p2 = PersonModel(
      person_id: 2,
      person_name: 'Ada',
      person_number: '698765245',
    );
    final p3 = PersonModel(
      person_id: 3,
      person_name: 'Ashe',
      person_number: '213654321',
    );
    list.addAll([p1, p2, p3]);
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return SavePage();
              },
            ),
          ).then((value) {
            print('hi again');
          });
        },
      ),
      body: FutureBuilder(
        future: showThemAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final list = snapshot.data;
            return ListView.builder(
              itemCount: list!.length,
              itemBuilder: (context, index) {
                final item = list[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailsPage(p1: item);
                            },
                          ),
                        )
                        .then((value) {});
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Text('${item.person_name} ${item.person_number}'),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Delete ? ${item.person_name}'),
                                  action: SnackBarAction(
                                    label: 'Yes',
                                    onPressed: () {
                                      print(item.person_id);
                                    },
                                  ),
                                ),
                              );
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      appBar: AppBar(
        title: isSearching == true
            ? TextField(
                onChanged: (value) {
                  setState(() {
                    text = value;
                  });
                },
                decoration: InputDecoration(hintText: 'Input person name'),
              )
            : Text('Contacts'),
        actions: [
          isSearching
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isSearching = false;
                      text = '';
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
        backgroundColor: Theme.of(context).colorScheme.primaryFixedDim,
      ),
    );
  }
}
