import 'package:auth_test/repository/auth_repository.dart';
import 'package:auth_test/repository/user_repository.dart';
import 'package:auth_test/screen/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:auth_test/screen/home/cubit/home_cubit.dart';
import 'package:auth_test/screen/login/cubit/login_cubit.dart';
import 'package:auth_test/screen/register/cubit/register_cubit.dart';
import 'package:injectable/injectable.dart';

@module
@injectable
abstract class BlocModule {
  @singleton
  @factoryMethod
  LoginCubit loginCubit(AuthRepository authRepository) =>
      LoginCubit(authRepository);

  @singleton
  @factoryMethod
  RegisterCubit registerCubit(AuthRepository authRepository) =>
      RegisterCubit(authRepository);

  @singleton
  @factoryMethod
  ForgotPasswordCubit forgotPasswordCubit(AuthRepository authRepository) =>
      ForgotPasswordCubit(authRepository);

  @singleton
  @factoryMethod
  HomeCubit homeCubit(UserRepository userRepository) =>
      HomeCubit(userRepository);
}
