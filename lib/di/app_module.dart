import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:login_app/data/repositories/auth_repository_impl.dart';
import 'package:login_app/di/firebase_service.dart';
import 'package:login_app/domain/repositories/auth_repository.dart';
import 'package:login_app/domain/uses_cases/auth/auth_usecase.dart';
import 'package:login_app/domain/uses_cases/auth/login_usecase.dart';
import 'package:login_app/domain/uses_cases/auth/logout_usecase.dart';
import 'package:login_app/domain/uses_cases/auth/register_usecase.dart';
import 'package:login_app/domain/uses_cases/auth/user_session_usecase.dart';

//Everytime yo add a new injectable you need execute:
//flutter packages pub run build_runner build
//flutter packages pub run build_runner watch

@module
abstract class AppModule {
  //Services init
  @preResolve //Priority service
  Future<FirebaseService> get firebaseService => FirebaseService.init();

  //Firebase Auth
  @injectable
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
  
  //FirebaseFirestore
  @injectable
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;

  //Colection Reference
  @injectable
  CollectionReference get usersCollection =>
      firebaseFirestore.collection("Users");

  //Auth Repository
  @Environment('Repositories')
  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl(firebaseAuth,usersCollection);

  //@Environment('UseCases')
  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
      login: LoginUseCase(authRepository),
      register: RegisterUseCase(authRepository),
      getUser: UserSessionUseCase(authRepository),
      logout: LogoutUseCase(authRepository));
}
