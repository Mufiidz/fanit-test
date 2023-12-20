// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'register_cubit.dart';

class RegisterStateMapper extends ClassMapperBase<RegisterState> {
  RegisterStateMapper._();

  static RegisterStateMapper? _instance;
  static RegisterStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RegisterStateMapper._());
      UserMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RegisterState';

  static String _$errorMessage(RegisterState v) => v.errorMessage;
  static const Field<RegisterState, String> _f$errorMessage =
      Field('errorMessage', _$errorMessage, opt: true, def: '');
  static StatusState _$statusState(RegisterState v) => v.statusState;
  static const Field<RegisterState, StatusState> _f$statusState =
      Field('statusState', _$statusState, opt: true, def: StatusState.idle);
  static User _$user(RegisterState v) => v.user;
  static const Field<RegisterState, User> _f$user =
      Field('user', _$user, opt: true, def: const User());

  @override
  final Map<Symbol, Field<RegisterState, dynamic>> fields = const {
    #errorMessage: _f$errorMessage,
    #statusState: _f$statusState,
    #user: _f$user,
  };

  static RegisterState _instantiate(DecodingData data) {
    return RegisterState(
        errorMessage: data.dec(_f$errorMessage),
        statusState: data.dec(_f$statusState),
        user: data.dec(_f$user));
  }

  @override
  final Function instantiate = _instantiate;

  static RegisterState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RegisterState>(map);
  }

  static RegisterState fromJson(String json) {
    return ensureInitialized().decodeJson<RegisterState>(json);
  }
}

mixin RegisterStateMappable {
  String toJson() {
    return RegisterStateMapper.ensureInitialized()
        .encodeJson<RegisterState>(this as RegisterState);
  }

  Map<String, dynamic> toMap() {
    return RegisterStateMapper.ensureInitialized()
        .encodeMap<RegisterState>(this as RegisterState);
  }

  RegisterStateCopyWith<RegisterState, RegisterState, RegisterState>
      get copyWith => _RegisterStateCopyWithImpl(
          this as RegisterState, $identity, $identity);
  @override
  String toString() {
    return RegisterStateMapper.ensureInitialized()
        .stringifyValue(this as RegisterState);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            RegisterStateMapper.ensureInitialized()
                .isValueEqual(this as RegisterState, other));
  }

  @override
  int get hashCode {
    return RegisterStateMapper.ensureInitialized()
        .hashValue(this as RegisterState);
  }
}

extension RegisterStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RegisterState, $Out> {
  RegisterStateCopyWith<$R, RegisterState, $Out> get $asRegisterState =>
      $base.as((v, t, t2) => _RegisterStateCopyWithImpl(v, t, t2));
}

abstract class RegisterStateCopyWith<$R, $In extends RegisterState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  UserCopyWith<$R, User, User> get user;
  $R call({String? errorMessage, StatusState? statusState, User? user});
  RegisterStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RegisterStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RegisterState, $Out>
    implements RegisterStateCopyWith<$R, RegisterState, $Out> {
  _RegisterStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RegisterState> $mapper =
      RegisterStateMapper.ensureInitialized();
  @override
  UserCopyWith<$R, User, User> get user =>
      $value.user.copyWith.$chain((v) => call(user: v));
  @override
  $R call({String? errorMessage, StatusState? statusState, User? user}) =>
      $apply(FieldCopyWithData({
        if (errorMessage != null) #errorMessage: errorMessage,
        if (statusState != null) #statusState: statusState,
        if (user != null) #user: user
      }));
  @override
  RegisterState $make(CopyWithData data) => RegisterState(
      errorMessage: data.get(#errorMessage, or: $value.errorMessage),
      statusState: data.get(#statusState, or: $value.statusState),
      user: data.get(#user, or: $value.user));

  @override
  RegisterStateCopyWith<$R2, RegisterState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _RegisterStateCopyWithImpl($value, $cast, t);
}
