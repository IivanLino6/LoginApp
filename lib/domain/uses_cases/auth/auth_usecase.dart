import 'package:injectable/injectable.dart';
import 'package:login_app/domain/uses_cases/auth/login_usecase.dart';
import 'package:login_app/domain/uses_cases/auth/register_usecase.dart';

class AuthUseCases {
  LoginUseCase login;
  RegisterUseCase register;

  //Constructor
  AuthUseCases({
    required this.login,
    required this.register
  });
}
