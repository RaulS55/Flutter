import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_rest/api/authentication_api/authentication_api.dart';
import 'package:flutter_api_rest/utils/dialogs.dart';
import 'package:flutter_api_rest/utils/responsive.dart';
import 'package:flutter_api_rest/widgest/input_text.dart';

///Mi login personalizado
class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  String _email = "", _password = "", _userName = "";
  final GlobalKey<FormState> _formKey = GlobalKey();
  final AuthenticationApi _authenticationApi = AuthenticationApi();

  Future<void> _submit() async {
    final isOk = _formKey.currentState!.validate();
    if (isOk) {
      ProgresDialog.show(context);
      await _authenticationApi.register(
        userName: _userName,
        email: _email,
        password: _password,
      );
      ProgresDialog.dissMiss(context);
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
                label: "User Name",
                fontSize: _responsive.dp(1.8),
                onChanged: (text) {
                  _userName = text;
                },
                validator: (text) {
                  if (text!.isNotEmpty) {
                    return null;
                  }
                  return "Invalid UserName";
                },
              ),
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
              SizedBox(
                width: double.infinity,
                child: CupertinoButton(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  color: Colors.pinkAccent,
                  child: const Text("Sing Up"),
                  onPressed: _submit,
                ),
              ),
              SizedBox(height: _responsive.dp(3)),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: _responsive.dp(1.7)),
                  ),
                  CupertinoButton(
                      child: Text(
                        "Sign up",
                        style: TextStyle(fontSize: _responsive.dp(1.7)),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
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
