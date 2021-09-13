import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snov/Screens/kirishScreen.dart';
import 'package:snov/Screens/orderScreen.dart';
import 'package:snov/Screens/profilhelp/helpPage.dart';
import 'package:snov/Screens/profilhelp/orders.dart';
import 'package:snov/const/consts.dart';
import 'package:snov/services/auth_service.dart';

class MyProfilScreen extends StatefulWidget {
  MyProfilScreen({Key? key});

  @override
  _MyProfilScreenState createState() => _MyProfilScreenState();
}

class _MyProfilScreenState extends State<MyProfilScreen> {
  FirebaseAuth _authUser = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kbottomColor,
      body: Container(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height:size.height * 0.06),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "My Profile",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Personal details",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangeScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "change",
                      style: TextStyle(color: ktextBottom),
                    ),
                  ),
                ],
              ),
              Card(
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.all(8),
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            image: DecorationImage(
                              image: AssetImage("assets/pp.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: StreamBuilder<Object>(
                        stream: FirebaseFirestore.instance
                            .collection("User")
                            .doc(_authUser.currentUser!.uid.toString())
                            .snapshots(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(2),
                                  child: Text(
                                    snapshot.data["name"].toString(),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(2),
                                  child: Text(
                                    FirebaseAuth.instance.currentUser!.email
                                        .toString(),
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                Divider(
                                  height: 8,
                                  color: Colors.black,
                                ),
                                Container(
                                  padding: EdgeInsets.all(2),
                                  child: Text(
                                    snapshot.data["number"].toString(),
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                Divider(
                                  height: 8,
                                  color: Colors.black,
                                ),
                                Container(
                                  padding: EdgeInsets.all(2),
                                  child: Text(
                                    snapshot.data["izoh"].toString(),
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                Divider(
                                  height: 6,
                                  color: Colors.black,
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderScreen(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          "Orders",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Icon(CupertinoIcons.forward, color: Colors.black),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              InkWell(
                onTap: () async {},
                child: Container(
                  padding: EdgeInsets.all(20),
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          "Payment method",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Icon(CupertinoIcons.forward, color: Colors.black),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HelpPage(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          "Help",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Icon(CupertinoIcons.forward, color: Colors.black),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
