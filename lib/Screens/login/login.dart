import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snov/Screens/drowermenu.dart';
import 'package:snov/const/consts.dart';
import 'package:snov/main.dart';
import 'package:snov/services/auth_service.dart';
import 'package:snov/zoom/zoomScreen.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _authService = AuthService();

  var _formKey = GlobalKey<FormState>();
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email address",
                ),
                validator: (String? text) {
                  if (text!.length < 6) {
                    return "Email 6 ta belgidan kam bolmasin !";
                  }
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                ),
                validator: (String? text) {
                  if (text!.length < 6) {
                    return "Password 6 ta belgidan kam bolmasin !";
                  }
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forget passworde?",
                    style: TextStyle(color: ktextBottom),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              InkWell(
                onTap: () async {
                  try {
                    dynamic natija =
                        await _authService.signInWithEmailFunksiyasi(
                      _emailController.text,
                      _passwordController.text,
                    );
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Zooom()),
                        (route) => false);
                    print(natija);
                  } catch (e) {
                    // SNACKBAR KERAK
                    print("LOGINDA XATO BOR: " + e.toString());
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: ktextBottom,
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(color: kbottomColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
