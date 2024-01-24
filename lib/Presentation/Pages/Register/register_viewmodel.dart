import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_app/Presentation/Pages/Register/register_state.dart';
import 'package:login_app/Presentation/utils/validation_item.dart';
import 'package:login_app/domain/uses_cases/auth/auth_usecase.dart';

class RegisterViewModel extends ChangeNotifier {
  //State
  RegisterState _state = RegisterState();

  RegisterViewModel(AuthUseCases authUseCases);
  //Getter
  RegisterState get state => _state;

  //FIREBASE AUTH Instace
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String validPassword = '';

  //Resource _response = Init();
  //Resource get response => _response;
  //UseCase
  //AuthUseCases _authUseCases;
  //RegisterViewModel(this._authUseCases);

  //Setter

  register() async {
    if (_state.isValid()) {
      //Initial State
      //_response = Loading();
      notifyListeners();
      //Register State
      //_response = await _authUseCases.register.launch(_state.toUser());
      notifyListeners();
      print('Form Values: ${_state.username.value}');
      print('Form Values: ${_state.email.value}');
      print('Form Values: ${_state.number.value}');
      print('Form Values: ${_state.password.value}');
    } else {
      print('Error en el formulario');
      Fluttertoast.showToast(
        msg:
            '${_state.username.error}\n${_state.email.error}\n${_state.number.error}\n${_state.validPassword.error}\n',
        backgroundColor: Colors.black,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  changeUsername(String value) {
    _state = _state.copyWith(username: ValidationItem(value: value));
    notifyListeners();
  }

  void changeEmail(String value) {
    //Validate email
    final bool validEmail =
        RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+').hasMatch(value);

    if (!validEmail && value.length >= 6) {
      _state = _state.copyWith(email: ValidationItem(value: value, error: ''));
    } else {
      _state =
          _state.copyWith(email: const ValidationItem(error: 'Invalid email'));
    }
    //Notifica al provider del cambio
    notifyListeners();
  }

  changePassword(String value) {
    validPassword = value;
    if (value.length >= 6) {
      _state =
          _state.copyWith(password: ValidationItem(value: value, error: ''));
    } else {
      _state =
          _state.copyWith(password: ValidationItem(error: 'invalid password'));
    }
    notifyListeners();
  }

  changeValidPassword(String value) {
    if (validPassword == value) {
      _state = _state.copyWith(
          validPassword: ValidationItem(value: value, error: ''));
    } else {
      _state = _state.copyWith(
          validPassword: ValidationItem(error: 'Password does not match'));
    }
    notifyListeners();
  }

  changeNumber(String value) {
    if (value.length >= 8) {
      _state = _state.copyWith(number: ValidationItem(value: value, error: ''));
    } else {
      _state = _state.copyWith(
          number: ValidationItem(error: 'Invalid phone number'));
    }
    notifyListeners();
  }

  resetResponse() {
    //_response = Init();
    notifyListeners();
  }
}
