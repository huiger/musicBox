
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:music_box/models/api_response/api_response.dart';
import 'package:music_box/models/kw_entity.dart';
import 'package:music_box/models/kw_music_set_detail.dart';
import 'package:music_box/models/lyric.dart';
import 'package:music_box/models/raw_data.dart';
import 'package:music_box/net/impl/kuwo_request.dart';
import 'package:music_box/net/request_config.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'exception.dart';

RequestClient kuWoRequestClient = RequestClient(KuWoRequest());

class RequestClient {
  late Dio _dio;

  RequestClient(RequestConfig requestConfig) {
    _dio = Dio(
        BaseOptions(baseUrl: requestConfig.baseUrl, connectTimeout: RequestConfig.connectTimeout));
    // _dio.interceptors.add(TokenInterceptor());
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true, requestBody: true, responseHeader: true));
  }

  Future<T?> request<T>(
      String url, {
        String method = "Get",
        Map<String, dynamic>? queryParameters,
        data,
        Map<String, dynamic>? headers,
        bool Function(ApiException)? onError,
      }) async {
    try {
      Options options = Options()
        ..method = method
        ..headers = headers;

      data = _convertRequestData(data);

      Response response = await _dio.request(url,
          queryParameters: queryParameters, data: data, options: options);

      return _handleResponse<T>(response);
    } catch (e) {
      var exception = ApiException.from(e);
      if(onError?.call(exception) != true){
        debugPrint(exception.message);
        throw exception;
      }
    }

    return null;
  }

  _convertRequestData(data) {
    if (data != null) {
      data = jsonDecode(jsonEncode(data));
    }
    return data;
  }

  Future<T?> get<T>(
      String url, {
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? headers,
        bool showLoading = true,
        bool Function(ApiException)? onError,
      }) {
    return request(url,
        queryParameters: queryParameters,
        headers: headers,
        onError: onError);
  }

  Future<T?> post<T>(
      String url, {
        Map<String, dynamic>? queryParameters,
        data,
        Map<String, dynamic>? headers,
        bool showLoading = true,
        bool Function(ApiException)? onError,
      }) {
    return request(url,
        method: "POST",
        queryParameters: queryParameters,
        data: data,
        headers: headers,
        onError: onError);
  }

  Future<T?> delete<T>(
      String url, {
        Map<String, dynamic>? queryParameters,
        data,
        Map<String, dynamic>? headers,
        bool showLoading = true,
        bool Function(ApiException)? onError,
      }) {
    return request(url,
        method: "DELETE",
        queryParameters: queryParameters,
        data: data,
        headers: headers,
        onError: onError);
  }

  Future<T?> put<T>(
      String url, {
        Map<String, dynamic>? queryParameters,
        data,
        Map<String, dynamic>? headers,
        bool showLoading = true,
        bool Function(ApiException)? onError,
      }) {
    return request(url,
        method: "PUT",
        queryParameters: queryParameters,
        data: data,
        headers: headers,
        onError: onError);
  }

  ///请求响应内容处理
  T? _handleResponse<T>(Response response) {
    if (response.statusCode == 200) {
      if(T.toString() == (RawData).toString()){
        RawData raw = RawData();
        raw.value = response.data;
        return raw as T;
      } else if(T.toString() == (KwEntity).toString()) {
        return KwEntity.fromJson(jsonDecode(response.data)) as T;
      } else if(T.toString() == (LyricResponse).toString()) {
        return LyricResponse.fromJson(jsonDecode(response.data)) as T;
      } else if(T.toString() == (String).toString()) {
        return response.data;
      } else if(T.toString() == (KwMusicSetDetail).toString()){
        return KwMusicSetDetail.fromJson(jsonDecode(response.data)) as T;
      } else {
        ApiResponse<T> apiResponse = ApiResponse<T>.fromJson(response.data);
        return _handleBusinessResponse<T>(apiResponse);
      }
    } else {
      var exception = ApiException(response.statusCode, ApiException.unknownException);
      throw exception;
    }
  }

  ///业务内容处理
  T? _handleBusinessResponse<T>(ApiResponse<T> response) {
    if (response.code == RequestConfig.successCode) {
      return response.data;
    } else {
      var exception = ApiException(response.code, response.message);
      throw exception;
    }
  }
}