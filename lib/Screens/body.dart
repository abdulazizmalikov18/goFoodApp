import 'package:flutter/material.dart';
import 'package:snov/Screens/login/loginScreen.dart';
import 'package:snov/const/consts.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ktextBottom,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 36,
              right: 36,
              top: 50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Image.asset(
                    "assets/oshpaz.png",
                    height: 48,
                  ),
                ),
                SizedBox(
                  height: 34,
                ),
                Text(
                  "CALEB G Restaurant",
                  style: TextStyle(fontSize: 56, color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/backgroundPerson.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            flex: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 36,
            ),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 24,
                      ),
                      child: Text(
                        "Get Started",
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      primary: ktextBottom,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}
