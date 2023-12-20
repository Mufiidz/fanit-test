import 'package:auth_test/repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../../../data/base_state.dart';
import '../../../models/user.dart';

part 'home_cubit.mapper.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final UserRepository _userRepository;
  HomeCubit(this._userRepository) : super(const HomeState());

  void initial() async {
    emit(state.copyWith(statusState: StatusState.loading));

    final result = await _userRepository.getUser();
    final emailResult = await _userRepository.isEmailVerified();

    var newState = result.when(
        result: (data) => state.copyWith(
              statusState: StatusState.idle,
              user: data,
            ),
        error: (String message) => state.copyWith(
              statusState: StatusState.failure,
              errorMessage: message,
            ));
    newState = emailResult.when(
        result: (data) =>
            newState.copyWith(isVerified: data, statusState: StatusState.idle),
        error: (String message) => newState.copyWith(
              errorMessage: message,
              statusState: StatusState.failure,
            ));
    emit(newState);
  }

  void logout() async {
    emit(state.copyWith(statusState: StatusState.loading));

    final result = await _userRepository.logout();
    final newState = result.when(
        result: (message) => state.copyWith(
              statusState: StatusState.success,
              message: message,
            ),
        error: (String message) => state.copyWith(
              statusState: StatusState.failure,
              errorMessage: message,
            ));
    emit(newState);
  }
}
