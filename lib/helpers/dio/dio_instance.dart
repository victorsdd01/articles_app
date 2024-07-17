import 'package:dio/dio.dart';

class DioInstance {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://localhost:3000/api',
    
  ));

  Dio get instance => _dio;
}

