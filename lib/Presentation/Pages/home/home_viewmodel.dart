import 'package:flutter/foundation.dart';
import 'package:login_app/domain/uses_cases/auth/auth_usecase.dart';

class HomeViewModel extends ChangeNotifier {
  AuthUseCases _authUseCases;
  int _currentIndex = 0;
//Getter
  int get currentIndex => _currentIndex;

//Setter
  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  HomeViewModel(this._authUseCases);

  logout() async {
    await _authUseCases.logout.launch();
  }
}