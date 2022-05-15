import 'package:flutter_api_rest/helper/http.dart';
import 'package:flutter_api_rest/helper/http_response.dart';
import 'package:flutter_api_rest/models/authentication_response.dart';

class AuthenticationApi {
  final Http _http;

  AuthenticationApi(this._http);

  Future<HttpResponse<AuthenticationResponse>> register(
      {required String userName,
      required String email,
      required String password}) {
    return _http.request<AuthenticationResponse>(
      "/api/v1/register",
      method: "POST",
      data: {
        "username": userName,
        "email": email,
        "password": password,
      },
      parser: (data) => AuthenticationResponse.fromJson(data),
    );
  }

  Future<HttpResponse<AuthenticationResponse>> login(
      {required String email, required String password}) async {
    return _http.request<AuthenticationResponse>(
      "/api/v1/login",
      method: "POST",
      data: {
        "email": email,
        "password": password,
      },
      parser: (data) {
        return AuthenticationResponse.fromJson(data);
      },
    );
  }
}
