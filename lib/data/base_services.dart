import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

mixin class BaseServices {
  final Dio _dio = Dio();

   String? apiUrl = dotenv.env['API_URL'];

  Dio get dio {
    return _dio;
  }
}