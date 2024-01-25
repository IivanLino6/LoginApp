import 'package:login_app/Presentation/utils/validation_item.dart';
import 'package:login_app/domain/model/user.dart';

class RegisterState {
  ValidationItem email;
  ValidationItem password;
  ValidationItem username;
  ValidationItem validPassword;
  ValidationItem number;
  //Constructor
  RegisterState(
      {this.email = const ValidationItem(),
      this.password = const ValidationItem(),
      this.username = const ValidationItem(),
      this.validPassword = const ValidationItem(),
      this.number = const ValidationItem()});

  //Check the values en the error
  bool isValid() {
    if (username.value.isEmpty ||
        username.error.isNotEmpty ||
        email.value.isEmpty ||
        email.error.isNotEmpty ||
        password.value.isEmpty ||
        password.error.isNotEmpty ||
        validPassword.value.isEmpty ||
        validPassword.error.isNotEmpty ||
        (password.value != validPassword.value)) {
      return false;
    }
    return true;
  }
   //Asigna el valor de los campos
  RegisterState copyWith(
          {ValidationItem? email,
          ValidationItem? password,
          ValidationItem? username,
          ValidationItem? validPassword,
          ValidationItem? age,
          ValidationItem? number}) =>
      RegisterState(
          email: email ?? this.email,
          password: password ?? this.password,
          username: username ?? this.username,
          validPassword: validPassword ?? this.validPassword,
          number: number ?? this.number);

    toUser() => UserData(
      email: this.email.value,
      username: this.username.value,
      password: this.password.value,
);
}
