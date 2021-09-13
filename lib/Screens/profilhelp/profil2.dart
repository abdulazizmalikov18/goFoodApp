import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snov/const/consts.dart';

class ProfilCard extends StatefulWidget {
  ProfilCard({Key? key}) : super(key: key);

  @override
  _ProfilCardState createState() => _ProfilCardState();
}

class _ProfilCardState extends State<ProfilCard> {
  FirebaseAuth _authUser = FirebaseAuth.instance;
  String? paymentValue;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kbottomColor,
      appBar: AppBar(
        title: Text(
          "Profil",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(2),
                child: Text(
                  "Information",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              SizedBox(height: size.height * 0.015,),
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
                height: size.height * 0.05,
              ),
              Container(padding:EdgeInsets.all(2),child: Text("Payment Method",style: TextStyle(color: Colors.black,fontSize:16))),
              SizedBox(
                height: size.height * 0.02,
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(22.0)),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Radio(
                                activeColor: Colors.amber,
                                value: "card",
                                groupValue: Colors.grey,
                                onChanged: (e) {
                                  setState(() {
                                    paymentValue = e! as String?;
                                  });
                                }),
                            Expanded(
                              child: Column(
                                children: [
                                  ListTile(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 4),
                                    leading: Container(
                                      alignment: Alignment.center,
                                      height: 42,
                                      width: 42,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        color: Color(0xFFF47B0A),
                                      ),
                                      child: Image.asset(
                                        "assets/icon/bi_credit-card-2-front-fill.png",
                                        height: 20,
                                        width: 20,
                                      ),
                                    ),
                                    title: Text("Card"),
                                  ),
                                  Divider(color: Colors.black.withOpacity(0.6)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Radio(
                              activeColor: Colors.amber,
                              value: "Mobile",
                              groupValue: Colors.grey,
                              onChanged: (e) {
                                setState(() {
                                  paymentValue = e! as String?;
                                });
                              },
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  ListTile(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 4),
                                    leading: Container(
                                      alignment: Alignment.center,
                                      height: 42,
                                      width: 42,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        color: Color(0xFFEB4796),
                                      ),
                                      child: Image.asset(
                                        "assets/icon/dashicons_bank.png",
                                        height: 20,
                                        width: 20,
                                      ),
                                    ),
                                    title: Text("Mobile Money (MTN,VODA)"),
                                  ),
                                  Divider(color: Colors.black.withOpacity(0.3)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(22.0)),
                    ),
                    padding: EdgeInsets.only(
                      bottom: 20,
                      left: 16,
                      right: 16,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Radio(
                              activeColor: Colors.amber,
                              value: "Pay",
                              groupValue: Colors.green,
                              onChanged: (e) {
                                setState(() {
                                  paymentValue = e as String?;
                                });
                              },
                            ),
                            Expanded(
                              child: ListTile(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 4),
                                leading: Container(
                                  alignment: Alignment.center,
                                  height: 42,
                                  width: 42,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    color: Color(0xFF0038FF),
                                  ),
                                  child: Image.asset(
                                    "assets/icon/cib_paypal.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                                title: Text("Pay on Delivery"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.08,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      color: ktextBottom,
                    ),
                    child: Text(
                      "Update Information",
                      style: TextStyle(color: kbottomColor),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height *0.1,),
            ],
          ),
        ),
      ),
    );
  }
}
