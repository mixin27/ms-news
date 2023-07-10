import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_response.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class AppResponse<T> extends Equatable {
  /// The boolean indicates the [AppResponse] is success or failed
  @JsonKey(defaultValue: true)
  final bool success;

  /// The status code of [AppResponse]
  @JsonKey(defaultValue: '')
  final String? code;

  /// The message of [AppResponse]
  @JsonKey(defaultValue: '')
  final String message;

  /// The description of [AppResponse]
  @JsonKey(defaultValue: '')
  final String? description;

  /// The [AppResponse] data
  final T? data;

  /// `statusCode` added by http response (Not from server)
  final int statusCode;

  /// `statusMessage` added by http response (Not from server)
  final String statusMessage;

  const AppResponse._({
    required this.success,
    this.code,
    required this.message,
    this.description,
    this.data,
    required this.statusCode,
    required this.statusMessage,
  });

  factory AppResponse({
    bool? success,
    String? code,
    required String message,
    String? description,
    int? statusCode,
    String? statusMessage,
    T? data,
  }) =>
      AppResponse._(
        success: success ?? false,
        code: code,
        message: message,
        description: description,
        statusCode: statusCode ?? 200,
        statusMessage: statusMessage ?? "The request has succeeded.",
      );

  @override
  List<Object?> get props => [
        success,
        message,
        data ?? "",
      ];

  factory AppResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$AppResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(
    Object? Function(T? value) toJsonT,
  ) =>
      _$AppResponseToJson(this, toJsonT);

  @override
  bool? get stringify => true;
}
