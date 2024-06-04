import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioException? error;
  final String? errorMessage;

  const DataState({this.data, this.error, this.errorMessage});
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed({DioException? error, String? errorMessage})
      : super(error: error, errorMessage: errorMessage);
}
