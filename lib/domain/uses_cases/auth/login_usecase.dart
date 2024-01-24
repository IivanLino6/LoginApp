
import 'package:login_app/domain/repositories/auth_repository.dart';

class LoginUseCase {
  AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  launch({required String email, required String password}) =>
      _authRepository.login(email: email, password: password);
}
