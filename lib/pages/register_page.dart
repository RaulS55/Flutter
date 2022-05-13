import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_rest/utils/responsive.dart';
import 'package:flutter_api_rest/widgest/circle.dart';
import 'package:flutter_api_rest/widgest/register_form.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                //CIRCULO ROSA
                Positioned(
                  top: -_responsive.hp(15),
                  right: -_responsive.wp(25),
                  child: Circle(
                    size: _responsive.wp(95),
                    colors: const [Colors.pinkAccent, Colors.pink],
                  ),
                ),
                //CIRCULO NARANJA
                Positioned(
                  top: -_responsive.wp(12),
                  left: -_responsive.wp(15),
                  child: Circle(
                    size: _responsive.wp(65),
                    colors: const [Colors.orange, Colors.deepOrangeAccent],
                  ),
                ),
                Positioned(
                  top: _responsive.hp(12),
                  child: Column(
                    children: [
                      Text(
                        "Hello,\nSing up to get startedk",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: _responsive.dp(2), color: Colors.white),
                      ),
                      const SizedBox(height: 40),
                      Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 20),
                                blurRadius: 10,
                              )
                            ]),
                        child: ClipOval(
                          child: Image.network(
                            "https://i.pinimg.com/236x/6f/fb/06/6ffb06eaeaace0d90a0596fac6c6377d.jpg",
                            width: _responsive.dp(15),
                            height: _responsive.dp(15),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                Positioned(
                    top: _responsive.hp(3),
                    left: _responsive.wp(2),
                    child: CupertinoButton(
                        child: Container(
                          padding: EdgeInsets.all(_responsive.dp(1)),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white10,
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        })),

                RegisterForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
