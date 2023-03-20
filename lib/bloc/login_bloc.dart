import 'package:flutter/material.dart';

class LoginBloc extends ChangeNotifier {
  bool _dispose = false;

  ////Getter
  bool get isDispose => _dispose;

  @override
  void notifyListeners() {
    if (!_dispose) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _dispose = true;
  }
}
