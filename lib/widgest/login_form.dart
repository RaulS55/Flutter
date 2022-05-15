import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_rest/api/authentication_api/authentication_api.dart';
import 'package:flutter_api_rest/utils/dialogs.dart';
import 'package:flutter_api_rest/utils/responsive.dart';
import 'package:flutter_api_rest/widgest/input_text.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

///Mi login personalizado
class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String _email = "", _password = "";
  final GlobalKey<FormState> _formKey = GlobalKey();
  final Logger _logger = Logger();

  Future<void> _submit() async {
    final isOk = _formKey.currentState!.validate();
    if (isOk) {
      ProgresDialog.show(context);
      final _authenticationApi = GetIt.instance<AuthenticationApi>();
      final response =
          await _authenticationApi.login(email: _email, password: _password);
      ProgresDialog.dissMiss(context);

      String message = "";
      if (response.error != null) {
        message = response.error!.message;
        if (response.error!.statusCode == -1) {
          message = "No internet";
        }
      }

      if (response.data != null) {
        Navigator.pushNamedAndRemoveUntil(context, "home", (route) => false);
      } else {
        _logger.e("Register Error StatusCode ${response.error!.statusCode}");
        _logger.e("Register Error message $message");
        _logger.e("Register Error data ${response.error!.data}");
        Dialogs.alert(context, title: "ERROR", description: message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive _responsive = Responsive(context);
    return Positioned(
      bottom: _responsive.hp(5),
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: _responsive.isTablet ? 430 : _responsive.wp(80)),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              InputText(
                label: "Email Addres",
                fontSize: _responsive.dp(1.8),
                onChanged: (text) {
                  _email = text;
                },
                validator: (text) {
                  if (text!.contains("@")) {
                    return null;
                  }
                  return "Invalid Email";
                },
              ),
              InputText(
                label: "Password",
                obscureText: true,
                suffix: true,
                fontSize: _responsive.dp(1.8),
                onChanged: (text) {
                  _password = text;
                },
                validator: (text) {
                  if (text!.trim().length > 1) {
                    return null;
                  }
                  return "Invalid Password";
                },
              ),
              SizedBox(height: _responsive.dp(6)),

              //BOTOM PARA LOGEAR
              SizedBox(
                width: double.infinity,
                child: CupertinoButton(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  color: Colors.pinkAccent,
                  child: const Text("Sing In"),
                  onPressed: _submit,
                ),
              ),
              SizedBox(height: _responsive.dp(3)),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "New to Friendly Desi?",
                    style: TextStyle(fontSize: _responsive.dp(1.7)),
                  ),
                  CupertinoButton(
                      child: Text(
                        "Sign up",
                        style: TextStyle(fontSize: _responsive.dp(1.7)),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "register");
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
