import 'dart:async';

import 'package:flutter/foundation.dart';

class DecrementCounterProvider with ChangeNotifier {
  int _counter = 0;
  bool _loading = false;

  DecrementCounterProvider();

  get counter => _counter;
  get loading => _loading;

  Future<void> decrement() async {
    _loading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 3), () {
      _counter++;
      _loading = false;

      notifyListeners();
    });
  }
}
