part of 'forgot_password_cubit.dart';

@MappableClass()
class ForgotPasswordState extends BaseState with ForgotPasswordStateMappable {
  final String message;
  const ForgotPasswordState(
      {super.errorMessage, super.statusState, this.message = ""});
}
