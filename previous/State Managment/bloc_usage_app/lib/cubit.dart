import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void get increaseCounter {
    emit(state + 1);
  }

  void get decreaseCounter {
    emit(state - 1);
  }
}
