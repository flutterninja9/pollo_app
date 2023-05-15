import 'package:freezed_annotation/freezed_annotation.dart';
part 'async_value.freezed.dart';

@freezed
class AsyncValue<T> with _$AsyncValue<T> {
  const factory AsyncValue.initial() = _Initial;
  const factory AsyncValue.loading() = _Loading;
  const factory AsyncValue.loaded(T data) = _Loaded;
  const factory AsyncValue.failure(String reason) = _Failure;
}
