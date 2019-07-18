import 'package:flutter/foundation.dart';

class CounterProvider with ChangeNotifier {
  int _counter;

  CounterProvider(this._counter);

  get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }
}
