import 'package:dio/dio.dart';
import 'data_state.dart';
import 'network_exceptions.dart';

class NetworkStateManager {
  static Future<DataState<T>> handleNetworkCall<T>({
    required Future<T> Function() call,
  }) async {
    try {
      final T response = await call();
      return DataState.success(response);
    } on DioException catch (e) {
      return DataState.failure(NetworkExceptions.getDioException(e));
    } catch (e) {
      return DataState.failure(NetworkExceptions.getDioException(e));
    }
  }
}
