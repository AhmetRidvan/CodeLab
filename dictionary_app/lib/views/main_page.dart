import 'package:dictionary_app/model/word_model.dart';
import 'package:dictionary_app/views/second_page.dart';
import 'package:dictionary_app/word_dao.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isSearching = false;
  String searchWord = '';

  Future<List<WordModel>> showAllWords() async {
    final listOfWords = await WordDao.bringThemAll();
    return listOfWords;
  }

    Future<List<WordModel>> search(String word) async {
    final listOfWords = await WordDao.search(word);
    return listOfWords;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching
            ? TextField(
                decoration: InputDecoration(hint: Text('Write something')),
                onChanged: (value) {
                  setState(() {
                    searchWord = value;
                  });
                },
              )
            : Text('Dictionary'),
        actions: [
          isSearching
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isSearching = false;
                      searchWord = '';
                    });
                  },
                  icon: Icon(Icons.cancel),
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
      body: FutureBuilder(
        future: isSearching ? search(searchWord) : showAllWords(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                var item = data[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return SecondPage(w1: item,);
                        },
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 50,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.center,
                              item.english,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.center,
                              item.turkish,
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
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
