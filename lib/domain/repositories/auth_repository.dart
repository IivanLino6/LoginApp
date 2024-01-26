import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_app/domain/model/user.dart';
import 'package:login_app/domain/utils/resources.dart';

abstract class AuthRepository {
   //Saber si el usuario esta loggeado
  User? get user;
  //Method
  Future<Resource> login({required String email, required String password});
  Future<Resource> register(UserData user);
  Future<void> logout();
}
