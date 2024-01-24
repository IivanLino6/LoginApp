import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_app/domain/repositories/auth_repository.dart';
import 'package:login_app/domain/utils/resources.dart';

class AuthRepositoryImpl implements AuthRepository{
   FirebaseAuth _firebaseAuth;

  AuthRepositoryImpl(this._firebaseAuth);

  @override
  Future<Resource> login(
      {required String email, required String password}) async {
    try {
      UserCredential data = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return Success(data);
    } on FirebaseAuthException catch (e) {
      return Error(e.message ?? 'Unknow Error');
    }
  }

}