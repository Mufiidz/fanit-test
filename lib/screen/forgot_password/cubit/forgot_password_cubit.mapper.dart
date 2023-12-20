// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'forgot_password_cubit.dart';

class ForgotPasswordStateMapper extends ClassMapperBase<ForgotPasswordState> {
  ForgotPasswordStateMapper._();

  static ForgotPasswordStateMapper? _instance;
  static ForgotPasswordStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ForgotPasswordStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ForgotPasswordState';

  static String _$errorMessage(ForgotPasswordState v) => v.errorMessage;
  static const Field<ForgotPasswordState, String> _f$errorMessage =
      Field('errorMessage', _$errorMessage, opt: true, def: '');
  static StatusState _$statusState(ForgotPasswordState v) => v.statusState;
  static const Field<ForgotPasswordState, StatusState> _f$statusState =
      Field('statusState', _$statusState, opt: true, def: StatusState.idle);
  static String _$message(ForgotPasswordState v) => v.message;
  static const Field<ForgotPasswordState, String> _f$message =
      Field('message', _$message, opt: true, def: "");

  @override
  final Map<Symbol, Field<ForgotPasswordState, dynamic>> fields = const {
    #errorMessage: _f$errorMessage,
    #statusState: _f$statusState,
    #message: _f$message,
  };

  static ForgotPasswordState _instantiate(DecodingData data) {
    return ForgotPasswordState(
        errorMessage: data.dec(_f$errorMessage),
        statusState: data.dec(_f$statusState),
        message: data.dec(_f$message));
  }

  @override
  final Function instantiate = _instantiate;

  static ForgotPasswordState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ForgotPasswordState>(map);
  }

  static ForgotPasswordState fromJson(String json) {
    return ensureInitialized().decodeJson<ForgotPasswordState>(json);
  }
}

mixin ForgotPasswordStateMappable {
  String toJson() {
    return ForgotPasswordStateMapper.ensureInitialized()
        .encodeJson<ForgotPasswordState>(this as ForgotPasswordState);
  }

  Map<String, dynamic> toMap() {
    return ForgotPasswordStateMapper.ensureInitialized()
        .encodeMap<ForgotPasswordState>(this as ForgotPasswordState);
  }

  ForgotPasswordStateCopyWith<ForgotPasswordState, ForgotPasswordState,
          ForgotPasswordState>
      get copyWith => _ForgotPasswordStateCopyWithImpl(
          this as ForgotPasswordState, $identity, $identity);
  @override
  String toString() {
    return ForgotPasswordStateMapper.ensureInitialized()
        .stringifyValue(this as ForgotPasswordState);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ForgotPasswordStateMapper.ensureInitialized()
                .isValueEqual(this as ForgotPasswordState, other));
  }

  @override
  int get hashCode {
    return ForgotPasswordStateMapper.ensureInitialized()
        .hashValue(this as ForgotPasswordState);
  }
}

extension ForgotPasswordStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ForgotPasswordState, $Out> {
  ForgotPasswordStateCopyWith<$R, ForgotPasswordState, $Out>
      get $asForgotPasswordState =>
          $base.as((v, t, t2) => _ForgotPasswordStateCopyWithImpl(v, t, t2));
}

abstract class ForgotPasswordStateCopyWith<$R, $In extends ForgotPasswordState,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? errorMessage, StatusState? statusState, String? message});
  ForgotPasswordStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ForgotPasswordStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ForgotPasswordState, $Out>
    implements ForgotPasswordStateCopyWith<$R, ForgotPasswordState, $Out> {
  _ForgotPasswordStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ForgotPasswordState> $mapper =
      ForgotPasswordStateMapper.ensureInitialized();
  @override
  $R call({String? errorMessage, StatusState? statusState, String? message}) =>
      $apply(FieldCopyWithData({
        if (errorMessage != null) #errorMessage: errorMessage,
        if (statusState != null) #statusState: statusState,
        if (message != null) #message: message
      }));
  @override
  ForgotPasswordState $make(CopyWithData data) => ForgotPasswordState(
      errorMessage: data.get(#errorMessage, or: $value.errorMessage),
      statusState: data.get(#statusState, or: $value.statusState),
      message: data.get(#message, or: $value.message));

  @override
  ForgotPasswordStateCopyWith<$R2, ForgotPasswordState, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ForgotPasswordStateCopyWithImpl($value, $cast, t);
}
