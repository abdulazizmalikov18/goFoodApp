import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snov/Dish.dart';

class DishContainer extends StatelessWidget {
  FirebaseAuth _authUser = FirebaseAuth.instance;
  QueryDocumentSnapshot? indexed;
  final int? index;
  final int? i;

  DishContainer({Key? key, this.index, this.i, this.indexed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: FirebaseFirestore.instance.collection("Taomlar").snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Container(
            child: CircularProgressIndicator(),
          );
        } else {
          return Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  alignment: Alignment.center,
                  height: 230,
                  width: 180,
                  // padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 100),
                          Text(
                            snapshot.data.docs[i]['name'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '\$' + snapshot.data.docs[i]['narx'].toString(),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: -10,
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.transparent,
                  child: Transform.scale(
                    scale: index == i ? 1 : 0.9,
                    child: Image.network(snapshot.data.docs[i]['img']),
                  ),
                ),
              )
            ],
          );
        }
      },
    );
  }
}
