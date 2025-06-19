import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
  int count = 0;

  int get read {
    print(count);
    return count;
  }

  void increaseCounter() {
    count++;
    notifyListeners();
  }

  void degreaseCounter(int amount) {
    count -=amount;
    notifyListeners();
  }
}
