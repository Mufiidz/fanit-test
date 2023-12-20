// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'data_result.dart';

class DataResultMapper extends ClassMapperBase<DataResult> {
  DataResultMapper._();

  static DataResultMapper? _instance;
  static DataResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DataResultMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DataResult';
  @override
  Function get typeFactory => <T>(f) => f<DataResult<T>>();

  static dynamic _$data(DataResult v) => v.data;
  static dynamic _arg$data<T>(f) => f<T>();
  static const Field<DataResult, dynamic> _f$data =
      Field('data', _$data, arg: _arg$data);

  @override
  final Map<Symbol, Field<DataResult, dynamic>> fields = const {
    #data: _f$data,
  };

  static DataResult<T> _instantiate<T>(DecodingData data) {
    return DataResult(data.dec(_f$data));
  }

  @override
  final Function instantiate = _instantiate;

  static DataResult<T> fromMap<T>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DataResult<T>>(map);
  }

  static DataResult<T> fromJson<T>(String json) {
    return ensureInitialized().decodeJson<DataResult<T>>(json);
  }
}

mixin DataResultMappable<T> {
  String toJson() {
    return DataResultMapper.ensureInitialized()
        .encodeJson<DataResult<T>>(this as DataResult<T>);
  }

  Map<String, dynamic> toMap() {
    return DataResultMapper.ensureInitialized()
        .encodeMap<DataResult<T>>(this as DataResult<T>);
  }

  DataResultCopyWith<DataResult<T>, DataResult<T>, DataResult<T>, T>
      get copyWith =>
          _DataResultCopyWithImpl(this as DataResult<T>, $identity, $identity);
  @override
  String toString() {
    return DataResultMapper.ensureInitialized()
        .stringifyValue(this as DataResult<T>);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            DataResultMapper.ensureInitialized()
                .isValueEqual(this as DataResult<T>, other));
  }

  @override
  int get hashCode {
    return DataResultMapper.ensureInitialized()
        .hashValue(this as DataResult<T>);
  }
}

extension DataResultValueCopy<$R, $Out, T>
    on ObjectCopyWith<$R, DataResult<T>, $Out> {
  DataResultCopyWith<$R, DataResult<T>, $Out, T> get $asDataResult =>
      $base.as((v, t, t2) => _DataResultCopyWithImpl(v, t, t2));
}

abstract class DataResultCopyWith<$R, $In extends DataResult<T>, $Out, T>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({T? data});
  DataResultCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DataResultCopyWithImpl<$R, $Out, T>
    extends ClassCopyWithBase<$R, DataResult<T>, $Out>
    implements DataResultCopyWith<$R, DataResult<T>, $Out, T> {
  _DataResultCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DataResult> $mapper =
      DataResultMapper.ensureInitialized();
  @override
  $R call({T? data}) =>
      $apply(FieldCopyWithData({if (data != null) #data: data}));
  @override
  DataResult<T> $make(CopyWithData data) =>
      DataResult(data.get(#data, or: $value.data));

  @override
  DataResultCopyWith<$R2, DataResult<T>, $Out2, T> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _DataResultCopyWithImpl($value, $cast, t);
}

class ErrorResultMapper extends ClassMapperBase<ErrorResult> {
  ErrorResultMapper._();

  static ErrorResultMapper? _instance;
  static ErrorResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ErrorResultMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ErrorResult';
  @override
  Function get typeFactory => <T>(f) => f<ErrorResult<T>>();

  static String _$message(ErrorResult v) => v.message;
  static const Field<ErrorResult, String> _f$message =
      Field('message', _$message);

  @override
  final Map<Symbol, Field<ErrorResult, dynamic>> fields = const {
    #message: _f$message,
  };

  static ErrorResult<T> _instantiate<T>(DecodingData data) {
    return ErrorResult(data.dec(_f$message));
  }

  @override
  final Function instantiate = _instantiate;

  static ErrorResult<T> fromMap<T>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ErrorResult<T>>(map);
  }

  static ErrorResult<T> fromJson<T>(String json) {
    return ensureInitialized().decodeJson<ErrorResult<T>>(json);
  }
}

mixin ErrorResultMappable<T> {
  String toJson() {
    return ErrorResultMapper.ensureInitialized()
        .encodeJson<ErrorResult<T>>(this as ErrorResult<T>);
  }

  Map<String, dynamic> toMap() {
    return ErrorResultMapper.ensureInitialized()
        .encodeMap<ErrorResult<T>>(this as ErrorResult<T>);
  }

  ErrorResultCopyWith<ErrorResult<T>, ErrorResult<T>, ErrorResult<T>, T>
      get copyWith => _ErrorResultCopyWithImpl(
          this as ErrorResult<T>, $identity, $identity);
  @override
  String toString() {
    return ErrorResultMapper.ensureInitialized()
        .stringifyValue(this as ErrorResult<T>);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ErrorResultMapper.ensureInitialized()
                .isValueEqual(this as ErrorResult<T>, other));
  }

  @override
  int get hashCode {
    return ErrorResultMapper.ensureInitialized()
        .hashValue(this as ErrorResult<T>);
  }
}

extension ErrorResultValueCopy<$R, $Out, T>
    on ObjectCopyWith<$R, ErrorResult<T>, $Out> {
  ErrorResultCopyWith<$R, ErrorResult<T>, $Out, T> get $asErrorResult =>
      $base.as((v, t, t2) => _ErrorResultCopyWithImpl(v, t, t2));
}

abstract class ErrorResultCopyWith<$R, $In extends ErrorResult<T>, $Out, T>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? message});
  ErrorResultCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ErrorResultCopyWithImpl<$R, $Out, T>
    extends ClassCopyWithBase<$R, ErrorResult<T>, $Out>
    implements ErrorResultCopyWith<$R, ErrorResult<T>, $Out, T> {
  _ErrorResultCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ErrorResult> $mapper =
      ErrorResultMapper.ensureInitialized();
  @override
  $R call({String? message}) =>
      $apply(FieldCopyWithData({if (message != null) #message: message}));
  @override
  ErrorResult<T> $make(CopyWithData data) =>
      ErrorResult(data.get(#message, or: $value.message));

  @override
  ErrorResultCopyWith<$R2, ErrorResult<T>, $Out2, T> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ErrorResultCopyWithImpl($value, $cast, t);
}
