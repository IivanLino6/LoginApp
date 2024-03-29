// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:login_app/di/app_module.dart' as _i8;
import 'package:login_app/di/firebase_service.dart' as _i7;
import 'package:login_app/domain/repositories/auth_repository.dart' as _i3;
import 'package:login_app/domain/uses_cases/auth/auth_usecase.dart' as _i4;

const String _Repositories = 'Repositories';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.AuthRepository>(
      () => appModule.authRepository,
      registerFor: {_Repositories},
    );
    gh.factory<_i4.AuthUseCases>(() => appModule.authUseCases);
    gh.factory<_i5.CollectionReference<Object?>>(
        () => appModule.usersCollection);
    gh.factory<_i6.FirebaseAuth>(() => appModule.firebaseAuth);
    gh.factory<_i5.FirebaseFirestore>(() => appModule.firebaseFirestore);
    await gh.factoryAsync<_i7.FirebaseService>(
      () => appModule.firebaseService,
      preResolve: true,
    );
    return this;
  }
}

class _$AppModule extends _i8.AppModule {}
