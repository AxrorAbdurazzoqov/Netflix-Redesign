import 'package:dio/dio.dart';

extension CheckConnection on Response {
  bool get isSucces => (statusCode != null && statusCode! >= 200 && statusCode! <= 300) ? true : false;
}