import 'dart:async';

import 'package:flutter/foundation.dart';

class CounterProvider with ChangeNotifier {
  int _counter;
  bool _loading = false;

  CounterProvider(this._counter);

  get counter => _counter;
  get loading => _loading;

  Future<void> increment() async {
    _loading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 3), () {
      _counter++;
      _loading = false;

      notifyListeners();
    });
  }

  Future<void> decrement() async {
    _loading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 3), () {
      _counter--;
      _loading = false;

      notifyListeners();
    });
  }
}
