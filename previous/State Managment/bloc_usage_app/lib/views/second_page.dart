import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_usage_app/cubit.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, int>(
              builder: (context, state) {
                return Text(state.toString());
              },
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CounterCubit>().increaseCounter;
              },
              child: Text('increase counter'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CounterCubit>().decreaseCounter;
              },
              child: Text('degrease counter'),
            ),
          ],
        ),
      ),
    );
  }
}
