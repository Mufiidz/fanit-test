part of 'register_cubit.dart';

@MappableClass()
class RegisterState extends BaseState with RegisterStateMappable {
  final User user;
  const RegisterState(
      {super.errorMessage, super.statusState, this.user = const User()});
}
