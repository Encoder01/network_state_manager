import 'package:freezed_annotation/freezed_annotation.dart';
import 'network_exceptions.dart';

part 'data_state.freezed.dart';

@freezed
class DataState<T> with _$DataState<T> {
  const factory DataState.success(T data) = DataSuccess<T>;
  const factory DataState.failure(NetworkExceptions error) = DataFailed<T>;
}
