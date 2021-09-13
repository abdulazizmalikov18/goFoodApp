import 'package:flutter/material.dart';
import 'package:snov/Screens/login/loginScreen.dart';
import 'package:snov/const/consts.dart';
import 'package:snov/main.dart';

class KirishScreen extends StatelessWidget {
  const KirishScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ktextBottom,
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.03),
              CircleAvatar(
                radius: 30,
                backgroundColor: korqafon,
                child: Transform.scale(
                  scale: 0.9,
                  child: Image.asset("assets/oshpaz.png"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "CALEB G",
                style: TextStyle(color: korqafon, fontSize: 50),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Restaurant",
                style: TextStyle(color: korqafon, fontSize: 50),
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
              Container(
                height: size.height * 0.41,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/man.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        color: korqafon,
                      ),
                      child: Text(
                        "Get starteed",
                        style: TextStyle(color: ktextBottom),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
