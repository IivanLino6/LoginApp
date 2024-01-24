import 'package:login_app/domain/utils/resources.dart';

abstract class AuthRepository {
  //Method
  Future<Resource> login({required String email, required String password});
}