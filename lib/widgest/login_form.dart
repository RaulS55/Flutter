import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_rest/utils/responsive.dart';
import 'package:flutter_api_rest/widgest/input_text.dart';

///Mi login personalizado
class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String _email = "", _password = "";
  final GlobalKey<FormState> _formKey = GlobalKey();

  _submit() {
    final isOk = _formKey.currentState!.validate();
    if (isOk) {}
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
