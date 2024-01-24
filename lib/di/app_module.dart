import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:login_app/data/repositories/auth_repository_impl.dart';
import 'package:login_app/di/firebase_service.dart';
import 'package:login_app/domain/repositories/auth_repository.dart';
import 'package:login_app/domain/uses_cases/auth/auth_usecase.dart';
import 'package:login_app/domain/uses_cases/auth/login_usecase.dart';

//Everytime yo add a new injectable you need execute:
//flutter packages pub run build_runner build

@module
abstract class AppModule {
  //Services init
  @preResolve //Priority service
  Future<FirebaseService> get firebaseService => FirebaseService.init();

  //Firebase Auth
  @injectable
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
  
  //Auth Repository
  @Environment('Repositories')
  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl(firebaseAuth);

  //@Environment('UseCases')
  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
        login: LoginUseCase(authRepository),
      );
}
