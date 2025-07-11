import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_usage_app/count_state.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

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
                context.read<CounterModel>().increaseCounter();
              },
              child: Text('increase counter'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CounterModel>().degreaseCounter(3);
              },
              child: Text('degrease counter'),
            ),
          ],
        ),
      ),
    );
  }
}
