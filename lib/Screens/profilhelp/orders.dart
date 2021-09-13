import 'package:flutter/material.dart';
import 'package:snov/Screens/myProfilScreen.dart';
import 'package:snov/const/consts.dart';
import 'package:snov/services/auth_service.dart';

class ChangeScreen extends StatefulWidget {
  const ChangeScreen({Key? key}) : super(key: key);

  @override
  _ChangeScreenState createState() => _ChangeScreenState();
}

class _ChangeScreenState extends State<ChangeScreen> {
  final AuthService _authService = AuthService();

  var _formKey = GlobalKey<FormState>();

  var _izoh = TextEditingController();

  var _ism = TextEditingController();

  var _name = TextEditingController();
  var _number = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String src;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Change Profil",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 28, right: 28, top: 28),
          child: Column(
            children: [
              Container(
                height: size.height * 0.25,
                width: size.width * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage("assets/pp.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.03),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _name,
                      decoration: InputDecoration(
                        labelText: "Name",
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _izoh,
                      decoration: InputDecoration(
                        labelText: "Izoh",
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _number,
                      decoration: InputDecoration(
                        labelText: "Number",
                      ),
                      validator: (String? text) {
                        if (text!.length < 12) {
                          return " 12 tadan kam!";
                        }
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                    InkWell(
                      onTap: () async {
                        try {
                          if (_formKey.currentState!.validate()) {
                            dynamic natija = await _authService.profilUpdate(
                              _name.text,
                              _izoh.text,
                              _number.text,
                            );
                            print(natija);
                            Navigator.pop(context);
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
                          "Change",
                          style: TextStyle(color: kbottomColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
