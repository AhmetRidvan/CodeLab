import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_usage_app/count_state.dart';
import 'package:provider_usage_app/views/second_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CounterModel>(
              builder: (context, value, child) {
                return Text(value.read.toString());
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SecondPage();
                    },
                  ),
                );
              },
              child: Text('Go to second'),
            ),
          ],
        ),
      ),
    );
  }
}
