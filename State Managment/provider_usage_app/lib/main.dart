import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_usage_app/count_state.dart';
import 'package:provider_usage_app/views/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (context) {
            return CounterModel();
          },
        ),
      ],child: MaterialApp(debugShowCheckedModeBanner: false,home: MainPage(),),
    );
  }
}
