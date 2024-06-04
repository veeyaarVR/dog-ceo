import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dog_ceo/core/constants/remote_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'app_exceptions.dart';

/// singleton class to contain all Dio methods and helper functions
class DioClient {
  DioClient._();

  static final instance = DioClient._();

  Dio get _dio {
    var dio = Dio(BaseOptions(
        baseUrl: baseURL,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        responseType: ResponseType.json));
    dio.interceptors.add(PrettyDioLogger(requestBody: true));
    return dio;
  }

  ///Get Method
  Future<Map<String, dynamic>> get(String path,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {
    try {
      await _isInternetAvailable();
      final Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 200) {
        return response.data;
      }
      throw _returnResponse(response);
    } on DioException catch (e) {
      if (e.response != null) {
        throw _returnResponse(e.response!);
      } else {
        throw 'Something went wrong';
      }
    } catch (e) {
      rethrow;
    }
  }

  ///Post Method
  Future<Map<String, dynamic>> post(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      await _isInternetAvailable();
      final Response response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
      throw _returnResponse(response);
    } on DioException catch (e) {
      if (e.response != null) {
        throw _returnResponse(e.response!);
      } else {
        throw 'Something went wrong';
      }
    } catch (e) {
      rethrow;
    }
  }

  ///Put Method
  Future<Map<String, dynamic>> put(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      await _isInternetAvailable();
      final Response response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 200) {
        return response.data;
      }
      throw _returnResponse(response);
    } on DioException catch (e) {
      if (e.response != null) {
        throw _returnResponse(e.response!);
      } else {
        throw 'Something went wrong';
      }
    } catch (e) {
      rethrow;
    }
  }

  ///Delete Method
  Future<dynamic> delete(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      await _isInternetAvailable();
      final Response response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      if (response.statusCode == 204) {
        return response.data;
      }
      throw _returnResponse(response);
    } on DioException catch (e) {
      if (e.response != null) {
        throw _returnResponse(e.response!);
      } else {
        throw 'Something went wrong';
      }
    } catch (e) {
      rethrow;
    }
  }

  String _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200 || 201 || 202:
        var responseJson = json.decode(response.statusCode.toString());
        print(responseJson);
        return responseJson;
      case 400 || 401 || 404:
        return BadRequestException(response.statusCode.toString()).toString();
      case 403:
        return UnauthorisedException(response.statusCode.toString()).toString();
      case 500:
        return BadRequestException(response.statusCode.toString()).toString();
      default:
        return FetchDataException(
                'Error occured while Communication with Server with StatusCode : ${response.statusCode}')
            .toString();
    }
  }

  Future<void> _isInternetAvailable() async {
    try {
      final foo = await InternetAddress.lookup('google.com');
      if (!foo.isNotEmpty || !foo[0].rawAddress.isNotEmpty) {
        throw InternetConnectionException();
      }
    } catch (e) {
      throw InternetConnectionException();
    }
  }

  bool isApiSuccess(Map<String, dynamic> responseJson) {
    String status = responseJson["status"];
    return status == "success";
  }
}
