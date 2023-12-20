// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/firebase_repository.dart' as _i5;
import '../repository/auth_repository.dart' as _i7;
import '../repository/user_repository.dart' as _i6;
import '../screen/forgot_password/cubit/forgot_password_cubit.dart' as _i8;
import '../screen/home/cubit/home_cubit.dart' as _i9;
import '../screen/login/cubit/login_cubit.dart' as _i10;
import '../screen/register/cubit/register_cubit.dart' as _i11;
import 'app_module.dart' as _i12;
import 'bloc_module.dart' as _i13;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    final blocModule = _$BlocModule();
    gh.lazySingleton<_i3.FirebaseAuth>(() => appModule.firebaseAuth);
    gh.lazySingleton<_i4.FirebaseFirestore>(() => appModule.firestore);
    gh.factory<_i5.FirebaseRepository>(
        () => _i5.FirebaseRepositoryImpl(gh<_i4.FirebaseFirestore>()));
    gh.factory<_i6.UserRepository>(() => _i6.UserRepositoryImpl(
          gh<_i5.FirebaseRepository>(),
          gh<_i3.FirebaseAuth>(),
        ));
    gh.factory<_i7.AuthRepository>(() => _i7.AuthRepositoryImpl(
          gh<_i5.FirebaseRepository>(),
          gh<_i3.FirebaseAuth>(),
        ));
    gh.singleton<_i8.ForgotPasswordCubit>(
        blocModule.forgotPasswordCubit(gh<_i7.AuthRepository>()));
    gh.singleton<_i9.HomeCubit>(blocModule.homeCubit(gh<_i6.UserRepository>()));
    gh.singleton<_i10.LoginCubit>(
        blocModule.loginCubit(gh<_i7.AuthRepository>()));
    gh.singleton<_i11.RegisterCubit>(
        blocModule.registerCubit(gh<_i7.AuthRepository>()));
    return this;
  }
}

class _$AppModule extends _i12.AppModule {}

class _$BlocModule extends _i13.BlocModule {}
