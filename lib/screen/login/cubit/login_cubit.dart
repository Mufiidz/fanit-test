import 'package:auth_test/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../../../data/base_state.dart';

part 'login_cubit.mapper.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository) : super(const LoginState());

  void login(String email, String password) async {
    emit(state.copyWith(statusState: StatusState.loading));

    final result = await _authRepository.login(email, password);

    final newState = result.when(
        result: (data) {
          final isVerified = data.user?.emailVerified ?? false;
          if (!isVerified) {
            return state.copyWith(
              statusState: StatusState.failure,
              message: "Please check your email to verify your account",
            );
          }
          return state.copyWith(
            statusState: StatusState.success,
            message: "Success Login",
          );
        },
        error: (String message) =>
            state.copyWith(message: message, statusState: StatusState.failure));
    emit(newState);
  }
}
