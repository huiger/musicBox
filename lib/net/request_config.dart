
import 'package:dio/dio.dart';

abstract class RequestConfig {
  String baseUrl = "";
  static const connectTimeout = 15000;
  static const successCode = 200;


  setBaseUrl(String url){
    baseUrl = url;
  }



}