import 'package:auth_test/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../../../data/base_state.dart';

part 'forgot_password_cubit.mapper.dart';
part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthRepository _authRepository;
  ForgotPasswordCubit(this._authRepository)
      : super(const ForgotPasswordState());

  void resetPassword(String email) async {
    emit(state.copyWith(statusState: StatusState.loading));

    final result = await _authRepository.resetPassword(email);

    final newState = result.when(
        result: (result) => state.copyWith(
            statusState: StatusState.success,
            message: "Email for reset password has been sent"),
        error: (error) => state.copyWith(
            statusState: StatusState.failure, errorMessage: error));
    emit(newState);
  }
}
