import 'dart:io';

import 'package:dio/dio.dart';

import 'package:ms_news/shared/shared.dart';

class AppInterceptor extends Interceptor {
  static AppInterceptor? _instance;

  AppInterceptor._private();

  factory AppInterceptor() => _instance ??= AppInterceptor._private();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    /// Do something here...
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Map custom response
    final responseData = mapResponseData(
      requestOptions: response.requestOptions,
      response: response,
    );

    return handler.resolve(responseData);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final errorMessage = getErrorMessage(
      err,
      err.response?.statusCode,
    );

    // Maps custom response
    final responseData = mapResponseData(
      requestOptions: err.requestOptions,
      response: err.response,
      customMessage: errorMessage,
      isErrorResponse: true,
    );

    return handler.resolve(responseData);
  }
}

Response<dynamic> mapResponseData({
  Response<dynamic>? response,
  required RequestOptions requestOptions,
  String customMessage = "",
  bool isErrorResponse = false,
}) {
  final bool hasResponseData = response?.data != null;

  Map<String, dynamic>? responseData = response?.data;

  if (hasResponseData) {
    responseData!.addAll({
      "success": isErrorResponse,
      "statusCode": response?.statusCode,
      "statusMessage": response?.statusMessage,
    });
  }

  return Response(
    requestOptions: requestOptions,
    data: hasResponseData
        ? responseData
        : AppResponse(
            success: isErrorResponse,
            message: customMessage,
            statusCode: response?.statusCode,
            statusMessage: response?.statusMessage,
          ).toJson((value) => null),
  );
}

class DioExceptionMessage {
  static const badRequestException = "Invalid request";
  static const internalServerErrorException =
      "Unknown error occurred, please try again later.";
  static const conflictException = "Conflict occurred";
  static const unauthorizedException = "Access denied";
  static const notFoundException =
      "The requested information could not be found";
  static const unexpectedException = "Unexpected error occurred.";
  static const noInternetConnectionException =
      "No internet connection detected, please try again.";
  static const deadlineExceededException =
      "The connection has timed out, please try again.";
  static const userCancelException = "User cancel the request.";
}

String getErrorMessage(DioException dioException, int? statusCode) {
  String errorMessage = "";
  switch (dioException.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      errorMessage = DioExceptionMessage.deadlineExceededException;
      break;
    case DioExceptionType.connectionError:
      errorMessage = DioExceptionMessage.noInternetConnectionException;
      break;
    case DioExceptionType.badResponse:
      switch (statusCode) {
        case 400:
          errorMessage = DioExceptionMessage.badRequestException;
          break;
        case 401:
          errorMessage = DioExceptionMessage.unauthorizedException;
          break;
        case 404:
          errorMessage = DioExceptionMessage.notFoundException;
          break;
        case 409:
          errorMessage = DioExceptionMessage.conflictException;
          break;
        case 500:
          errorMessage = DioExceptionMessage.internalServerErrorException;
          break;
      }
      break;
    case DioExceptionType.cancel:
      errorMessage = DioExceptionMessage.userCancelException;
      break;
    case DioExceptionType.unknown:
      eLog(dioException.error);
      if (dioException.error is SocketException) {
        errorMessage = DioExceptionMessage.noInternetConnectionException;
      } else {
        errorMessage = DioExceptionMessage.unexpectedException;
      }
      break;
    case DioExceptionType.badCertificate:
      break;
  }

  return errorMessage;
}
