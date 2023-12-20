// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'login_cubit.dart';

class LoginStateMapper extends ClassMapperBase<LoginState> {
  LoginStateMapper._();

  static LoginStateMapper? _instance;
  static LoginStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoginStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LoginState';

  static String _$message(LoginState v) => v.message;
  static const Field<LoginState, String> _f$message =
      Field('message', _$message, opt: true, def: "");
  static StatusState _$statusState(LoginState v) => v.statusState;
  static const Field<LoginState, StatusState> _f$statusState =
      Field('statusState', _$statusState, opt: true, def: StatusState.idle);

  @override
  final Map<Symbol, Field<LoginState, dynamic>> fields = const {
    #message: _f$message,
    #statusState: _f$statusState,
  };

  static LoginState _instantiate(DecodingData data) {
    return LoginState(
        message: data.dec(_f$message), statusState: data.dec(_f$statusState));
  }

  @override
  final Function instantiate = _instantiate;

  static LoginState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LoginState>(map);
  }

  static LoginState fromJson(String json) {
    return ensureInitialized().decodeJson<LoginState>(json);
  }
}

mixin LoginStateMappable {
  String toJson() {
    return LoginStateMapper.ensureInitialized()
        .encodeJson<LoginState>(this as LoginState);
  }

  Map<String, dynamic> toMap() {
    return LoginStateMapper.ensureInitialized()
        .encodeMap<LoginState>(this as LoginState);
  }

  LoginStateCopyWith<LoginState, LoginState, LoginState> get copyWith =>
      _LoginStateCopyWithImpl(this as LoginState, $identity, $identity);
  @override
  String toString() {
    return LoginStateMapper.ensureInitialized()
        .stringifyValue(this as LoginState);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            LoginStateMapper.ensureInitialized()
                .isValueEqual(this as LoginState, other));
  }

  @override
  int get hashCode {
    return LoginStateMapper.ensureInitialized().hashValue(this as LoginState);
  }
}

extension LoginStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LoginState, $Out> {
  LoginStateCopyWith<$R, LoginState, $Out> get $asLoginState =>
      $base.as((v, t, t2) => _LoginStateCopyWithImpl(v, t, t2));
}

abstract class LoginStateCopyWith<$R, $In extends LoginState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? message, StatusState? statusState});
  LoginStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _LoginStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LoginState, $Out>
    implements LoginStateCopyWith<$R, LoginState, $Out> {
  _LoginStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LoginState> $mapper =
      LoginStateMapper.ensureInitialized();
  @override
  $R call({String? message, StatusState? statusState}) =>
      $apply(FieldCopyWithData({
        if (message != null) #message: message,
        if (statusState != null) #statusState: statusState
      }));
  @override
  LoginState $make(CopyWithData data) => LoginState(
      message: data.get(#message, or: $value.message),
      statusState: data.get(#statusState, or: $value.statusState));

  @override
  LoginStateCopyWith<$R2, LoginState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LoginStateCopyWithImpl($value, $cast, t);
}
