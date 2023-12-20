part of 'home_cubit.dart';

@MappableClass()
class HomeState extends BaseState with HomeStateMappable {
  final User user;
  final bool isVerified;
  final String message;
  const HomeState(
      {this.user = const User(),
      this.message = "",
      this.isVerified = false,
      super.statusState,
      super.errorMessage});
}
