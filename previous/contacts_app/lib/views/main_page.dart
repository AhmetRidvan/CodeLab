import 'package:contacts_app/cubit/person_bring_cubit.dart';
import 'package:contacts_app/model/person_model.dart';
import 'package:contacts_app/views/details_page.dart';
import 'package:contacts_app/views/save_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isSearching = false;
  String text = '';
  @override
  void initState() {
    super.initState();
    context.read<PersonBringCubit>().bringThemAll();
  }

  Future<List<PersonModel>> showThemAll() async {
    final list = <PersonModel>[];

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
      body: BlocBuilder<PersonBringCubit, List<PersonModel>>(
        builder: (context, data) {
          if (data.isNotEmpty) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
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
                                      context.read<PersonBringCubit>().delete(
                                        item.person_id,
                                      );
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
                    context.read<PersonBringCubit>().search(value);
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
                      context.read<PersonBringCubit>().bringThemAll();
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
