import 'package:flutter/material.dart';
import 'package:snov/const/consts.dart';
import 'package:snov/main.dart';

class OrderScreen extends StatefulWidget {
  OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Orders",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                Container(
                  height: 120,
                  child: Image(
                    image: AssetImage('assets/icon/savat.png'),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "  No Orders yet",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "  Hit the orange button down \n    below to Create an order",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ),
                );
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
                  "Start Ordering",
                  style: TextStyle(color: kbottomColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
