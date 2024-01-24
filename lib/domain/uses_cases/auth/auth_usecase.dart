import 'package:injectable/injectable.dart';
import 'package:login_app/domain/uses_cases/auth/login_usecase.dart';

class AuthUseCases {
  LoginUseCase login;
  
  //Constructor
  AuthUseCases(
      {required this.login, });
}