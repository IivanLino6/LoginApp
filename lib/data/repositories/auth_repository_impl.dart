import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_app/domain/model/user.dart';
import 'package:login_app/domain/repositories/auth_repository.dart';
import 'package:login_app/domain/utils/resources.dart';

class AuthRepositoryImpl implements AuthRepository {
  FirebaseAuth _firebaseAuth;
  CollectionReference _usersCollection;

  AuthRepositoryImpl(this._firebaseAuth, this._usersCollection);

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
  
  @override
  Future<void> logout() async{
    await _firebaseAuth.signOut();
  }

  @override
  Future<Resource> register(UserData user) async {
    try {
      //Data retorna la informacion de la creacion del usuario
      UserCredential data = await _firebaseAuth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
      user.password = '';
      //Asigna el valor de UID
      user.id = data.user?.uid ?? "";
      //Selecciona el doc de firebase con base al uid obtenido de data
      await _usersCollection.doc(user.id).set(user.toJson());
      return Success(data);
    } on FirebaseAuthException catch (e) {
      return Error(e.message ?? 'Unknow Error');
    }
  }
  
  @override
  User? get user => _firebaseAuth.currentUser;
}
