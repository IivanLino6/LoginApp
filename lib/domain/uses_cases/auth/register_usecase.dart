
import 'package:login_app/domain/model/user.dart';
import 'package:login_app/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  AuthRepository _repository;

  //Contructor
  RegisterUseCase(this._repository);

  //Method
  launch(UserData user) => _repository.register(user);
}