import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_app/domain/repositories/auth_repository.dart';

class UserSessionUseCase {
  AuthRepository _repository;
  UserSessionUseCase(this._repository);

  //Getter
  User? get userSession => this._repository.user;
}