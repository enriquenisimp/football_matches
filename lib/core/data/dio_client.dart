import 'package:dio/dio.dart';

class DioClient{
  final dio =Dio();

  Dio getClient(){
    return dio;
  }
}