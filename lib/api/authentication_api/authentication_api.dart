import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class AuthenticationApi {
  final Dio _dio = Dio();
  final Logger _logger = Logger();

  Future<void> register(
      {required String userName,
      required String email,
      required String password}) async {
    try {
      final response = await _dio.post(
        "https://curso-api-flutter.herokuapp.com/api/v1/register",
        //options: Options(headers: {"Content-Type": "application/json"}),
        data: {
          "username": userName,
          "email": email,
          "password": password,
        },
      );
      //Tiene los datos devueltos por la API
      _logger.i(response.data);
    } catch (e) {
      _logger.e(e);
    }
  }
}
