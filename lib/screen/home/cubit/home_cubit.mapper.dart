// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'home_cubit.dart';

class HomeStateMapper extends ClassMapperBase<HomeState> {
  HomeStateMapper._();

  static HomeStateMapper? _instance;
  static HomeStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HomeStateMapper._());
      UserMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'HomeState';

  static User _$user(HomeState v) => v.user;
  static const Field<HomeState, User> _f$user =
      Field('user', _$user, opt: true, def: const User());
  static String _$message(HomeState v) => v.message;
  static const Field<HomeState, String> _f$message =
      Field('message', _$message, opt: true, def: "");
  static bool _$isVerified(HomeState v) => v.isVerified;
  static const Field<HomeState, bool> _f$isVerified =
      Field('isVerified', _$isVerified, opt: true, def: false);
  static StatusState _$statusState(HomeState v) => v.statusState;
  static const Field<HomeState, StatusState> _f$statusState =
      Field('statusState', _$statusState, opt: true, def: StatusState.idle);
  static String _$errorMessage(HomeState v) => v.errorMessage;
  static const Field<HomeState, String> _f$errorMessage =
      Field('errorMessage', _$errorMessage, opt: true, def: '');

  @override
  final Map<Symbol, Field<HomeState, dynamic>> fields = const {
    #user: _f$user,
    #message: _f$message,
    #isVerified: _f$isVerified,
    #statusState: _f$statusState,
    #errorMessage: _f$errorMessage,
  };

  static HomeState _instantiate(DecodingData data) {
    return HomeState(
        user: data.dec(_f$user),
        message: data.dec(_f$message),
        isVerified: data.dec(_f$isVerified),
        statusState: data.dec(_f$statusState),
        errorMessage: data.dec(_f$errorMessage));
  }

  @override
  final Function instantiate = _instantiate;

  static HomeState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HomeState>(map);
  }

  static HomeState fromJson(String json) {
    return ensureInitialized().decodeJson<HomeState>(json);
  }
}

mixin HomeStateMappable {
  String toJson() {
    return HomeStateMapper.ensureInitialized()
        .encodeJson<HomeState>(this as HomeState);
  }

  Map<String, dynamic> toMap() {
    return HomeStateMapper.ensureInitialized()
        .encodeMap<HomeState>(this as HomeState);
  }

  HomeStateCopyWith<HomeState, HomeState, HomeState> get copyWith =>
      _HomeStateCopyWithImpl(this as HomeState, $identity, $identity);
  @override
  String toString() {
    return HomeStateMapper.ensureInitialized()
        .stringifyValue(this as HomeState);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            HomeStateMapper.ensureInitialized()
                .isValueEqual(this as HomeState, other));
  }

  @override
  int get hashCode {
    return HomeStateMapper.ensureInitialized().hashValue(this as HomeState);
  }
}

extension HomeStateValueCopy<$R, $Out> on ObjectCopyWith<$R, HomeState, $Out> {
  HomeStateCopyWith<$R, HomeState, $Out> get $asHomeState =>
      $base.as((v, t, t2) => _HomeStateCopyWithImpl(v, t, t2));
}

abstract class HomeStateCopyWith<$R, $In extends HomeState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  UserCopyWith<$R, User, User> get user;
  $R call(
      {User? user,
      String? message,
      bool? isVerified,
      StatusState? statusState,
      String? errorMessage});
  HomeStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _HomeStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HomeState, $Out>
    implements HomeStateCopyWith<$R, HomeState, $Out> {
  _HomeStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HomeState> $mapper =
      HomeStateMapper.ensureInitialized();
  @override
  UserCopyWith<$R, User, User> get user =>
      $value.user.copyWith.$chain((v) => call(user: v));
  @override
  $R call(
          {User? user,
          String? message,
          bool? isVerified,
          StatusState? statusState,
          String? errorMessage}) =>
      $apply(FieldCopyWithData({
        if (user != null) #user: user,
        if (message != null) #message: message,
        if (isVerified != null) #isVerified: isVerified,
        if (statusState != null) #statusState: statusState,
        if (errorMessage != null) #errorMessage: errorMessage
      }));
  @override
  HomeState $make(CopyWithData data) => HomeState(
      user: data.get(#user, or: $value.user),
      message: data.get(#message, or: $value.message),
      isVerified: data.get(#isVerified, or: $value.isVerified),
      statusState: data.get(#statusState, or: $value.statusState),
      errorMessage: data.get(#errorMessage, or: $value.errorMessage));

  @override
  HomeStateCopyWith<$R2, HomeState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _HomeStateCopyWithImpl($value, $cast, t);
}
