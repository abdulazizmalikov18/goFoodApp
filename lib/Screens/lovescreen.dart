import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoveScreen extends StatefulWidget {
  LoveScreen({Key? key}) : super(key: key);

  @override
  _LoveScreenState createState() => _LoveScreenState();
}

class _LoveScreenState extends State<LoveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Love",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_border,
              size: 100,
              color: Colors.grey,
            ),
            Text(
              "No Love yet",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Hit the orange button down \n  below to Create an order",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
