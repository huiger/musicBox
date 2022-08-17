import 'dart:convert';

class ApiResponse<T> {

  int? code;
  String? message;
  T? data;

  ApiResponse();

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    final ApiResponse<T> apiResponseEntity = ApiResponse<T>();
    final int? code = json['code'];
    if (code != null) {
      apiResponseEntity.code = code;
    }
    final String? message = json['message'];
    if (message != null) {
      apiResponseEntity.message = message;
    }
    T? data = json['data'];

    if (data != null) {
      apiResponseEntity.data = data;
    }
    return apiResponseEntity;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};
    result['code'] = code ?? 0;
    result['message'] = message ?? '';
    result['data'] = data;
    return result;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

