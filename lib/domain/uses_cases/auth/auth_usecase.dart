import 'package:injectable/injectable.dart';
import 'package:login_app/domain/uses_cases/auth/login_usecase.dart';
import 'package:login_app/domain/uses_cases/auth/logout_usecase.dart';
import 'package:login_app/domain/uses_cases/auth/register_usecase.dart';
import 'package:login_app/domain/uses_cases/auth/user_session_usecase.dart';

class AuthUseCases {
  LoginUseCase login;
  RegisterUseCase register;
  UserSessionUseCase getUser;
  LogoutUseCase logout;

  //Constructor
  AuthUseCases(
      {required this.login, required this.register, required this.getUser, required this.logout});
}
