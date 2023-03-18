import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

part 'counter.g.dart';

class CounterStore = _CounterStore with _$CounterStore;

abstract class _CounterStore with Store {
  @observable
  int counterValue = 0;

  @action
  void incrementCounter() {
    counterValue++;
    debugPrint('Incremented Counter Value : $counterValue');
  }

  @action
  void decrementCounter() {
    counterValue--;
    debugPrint('Decremented Counter Value : $counterValue');
  }

  @action
  void resetCounter() {
    if (counterValue == 0) {
      debugPrint('Counter already reset');
    } else {
      counterValue = 0;
      debugPrint('Reset Counter Value : $counterValue');
    }
  }
}
