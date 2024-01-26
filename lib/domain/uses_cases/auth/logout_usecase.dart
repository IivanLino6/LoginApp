import 'package:login_app/domain/repositories/auth_repository.dart';

class LogoutUseCase {
  AuthRepository _repository;
  //Contructor
  LogoutUseCase(this._repository);

  launch() => _repository.logout();
}