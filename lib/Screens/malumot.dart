import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:snov/const/consts.dart';
import 'package:snov/main.dart';

class MalumotScreen extends StatelessWidget {
  final int? index;
  final int? i;
  const MalumotScreen({Key? key, this.index, this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(""),
        // actions: [
        //   (k == false)
        //       ? IconButton(
        //           onPressed: () {
        //             setState(() {
        //               k = true;
        //               print("like boldi" + k.toString());
        //             });
        //           },
        //           icon: Icon(Icons.favorite_border),
        //         )
        //       // ignore: dead_code
        //       : IconButton(
        //           onPressed: () {
        //             setState(() {
        //               k = false;
        //               print("like boldi" + k.toString());
        //             });
        //           },
        //           icon: Icon(Icons.favorite),
        //         ),
        // ],
      ),
      body: StreamBuilder<Object>(
          stream: FirebaseFirestore.instance.collection("Taomlar").snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Center(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: ListView(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 200,
                                child: Image.network(
                                  snapshot.data.docs[index]['img'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                snapshot.data.docs[index]['name'],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '\$' +
                                    snapshot.data.docs[index]['narx']
                                        .toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.orange,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 28, right: 28, top: 28, bottom: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Delivery Info",
                                      style: TextStyle(
                                          color: Colors.black87, fontSize: 18),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "Delivered between monday aug and thusday 20 from 8pm to 91:32pm ",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Return policy",
                                      style: TextStyle(
                                          color: Colors.black87, fontSize: 18),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "All our foods are double checked before leaving our stores so by any case you found a broken food please contact our hotline immediately.",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
                          "Add to cart",
                          style: TextStyle(color: kbottomColor),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },),
    );
  }
}