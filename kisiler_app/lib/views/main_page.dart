import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usage_app/cubits/main_page_cubit.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final tFirst = TextEditingController();
  final tSecond = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocBuilder<MainPageCubit, int>(
                builder: (context, state) {
                  return Text(state.toString(), style: TextStyle(fontSize: 30));
                },
              ),
              TextField(
                controller: tFirst,
                decoration: InputDecoration(hintText: 'First'),
              ),
              TextField(
                controller: tSecond,
                decoration: InputDecoration(hintText: 'Second'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<MainPageCubit>().add(
                        tFirst.text,
                        tSecond.text,
                      );
                    },
                    child: Text('+'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<MainPageCubit>().subtraction(
                        tFirst.text,
                        tSecond.text,
                      );
                    },
                    child: Text('*'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
