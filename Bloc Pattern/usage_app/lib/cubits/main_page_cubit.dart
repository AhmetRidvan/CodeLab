import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usage_app/repos/math_repo.dart';

class MainPageCubit extends Cubit<int> {
  MainPageCubit() : super(0);

  void add(String incomingNumber1, String incomingNumber2) {
    emit(MathRepo.add(incomingNumber1, incomingNumber2));
  }

  void subtraction(String incomingNumber1, String incomingNumber2) {
    emit(MathRepo.subtraction(incomingNumber1, incomingNumber2));
  }
}
