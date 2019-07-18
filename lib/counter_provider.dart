import 'dart:async';

import 'package:flutter/foundation.dart';

class CounterProvider with ChangeNotifier {
  int _counter;

  CounterProvider(this._counter);

  get counter => _counter;

  Future<void> increment() => Future.delayed(Duration(seconds: 3), () {
    _counter++;
    notifyListeners();
  });

  Future<void> decrement() => Future.delayed(Duration(seconds: 3), () {
    _counter--;
    notifyListeners();
  });
}
