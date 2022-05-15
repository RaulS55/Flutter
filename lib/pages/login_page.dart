import 'package:flutter/material.dart';
import 'package:flutter_api_rest/utils/responsive.dart';
import 'package:flutter_api_rest/widgest/circle.dart';
import 'package:flutter_api_rest/widgest/icon_container.dart';
import 'package:flutter_api_rest/widgest/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final _padding = MediaQuery.of(context).padding;
    final Responsive _responsive = Responsive(context);
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Container(
            color: Colors.transparent,
            width: double.infinity,
            height: _responsive.height - _padding.bottom - _padding.top,
            constraints: BoxConstraints(
                minHeight: _responsive.height - _padding.bottom - _padding.top),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: -_responsive.hp(15),
                  right: -_responsive.wp(25),
                  child: Circle(
                    size: _responsive.wp(90),
                    colors: const [Colors.pinkAccent, Colors.pink],
                  ),
                ),
                Positioned(
                  top: -_responsive.wp(10),
                  left: -_responsive.wp(15),
                  child: Circle(
                    size: _responsive.wp(60),
                    colors: const [Colors.orange, Colors.deepOrangeAccent],
                  ),
                ),
                Positioned(
                  top: _responsive.hp(20),
                  child: Column(
                    children: [
                      IconContainer(size: _responsive.width),
                      SizedBox(height: _responsive.dp(3)),
                      Text(
                        "Hello again,\nWellcome back",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: _responsive.dp(2)),
                      ),
                    ],
                  ),
                ),
                const LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
