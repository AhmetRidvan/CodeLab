import 'package:contacts_app/cubit/person_bring_cubit.dart';
import 'package:contacts_app/cubit/person_save_cubit.dart';
import 'package:contacts_app/cubit/person_update.dart';


import 'package:contacts_app/views/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return PersonSaveCubit();
          },
        ),
        BlocProvider(
          create: (context) {
            return PersonUpdateCubit();
          },
        ),
        BlocProvider(
          create: (context) {
            return PersonBringCubit();
          },
        ),
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        ),
        home: MainPage(),
      ),
    );
  }
}
