import 'package:dio/dio.dart';
import 'package:flutter_api_rest/api/authentication_api/authentication_api.dart';
import 'package:flutter_api_rest/helper/http.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

abstract class DependencyInjection {
  static void inicialize() {
    final Dio dio =
        Dio(BaseOptions(baseUrl: "https://curso-api-flutter.herokuapp.com"));
    final Logger logger = Logger();

    Http http = Http(
      dio: dio,
      logger: logger,
      logsEnabled: true,
    );
    final AuthenticationApi authenticationAPI = AuthenticationApi(http);

    GetIt.instance.registerSingleton<AuthenticationApi>(authenticationAPI);
  }
}
