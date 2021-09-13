import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snov/Screens/drowermenu.dart';
import 'package:snov/const/consts.dart';
import 'package:snov/main.dart';
import 'package:snov/services/auth_service.dart';
import 'package:snov/services/database.dart';
import 'package:snov/zoom/zoomScreen.dart';

class SignUpe extends StatefulWidget {
  SignUpe({Key? key}) : super(key: key);

  @override
  _SignUpeState createState() => _SignUpeState();
}

class _SignUpeState extends State<SignUpe> {
  final AuthService _authService = AuthService();

  var _formKey = GlobalKey<FormState>();

  var _emailController = TextEditingController();

  var _passwordController = TextEditingController();

  var _name = TextEditingController();

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
              TextFormField(
                keyboardType: TextInputType.name,
                controller: _name,
                decoration: InputDecoration(
                  labelText: "Name",
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              InkWell(
                onTap: () async {
                  try {
                    if (_formKey.currentState!.validate()) {
                      dynamic natija =
                          await _authService.signUpWithEmailFunksiyasi(
                        _emailController.text,
                        _passwordController.text,
                        _name.text,
                      );
                      print(natija);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Zooom()),
                          (route) => false);
                    }
                  } catch (e) {
                    print("SIGN UPDAN XATO BOR !: $e");
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
                    "Register",
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
