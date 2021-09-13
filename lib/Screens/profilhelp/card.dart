import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        title: Text(
          "Cart",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 24.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 20.0,
                  width: 20.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/iwwa_swipe.png"),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  "swipe on an item to delete",
                  style: TextStyle(fontSize: 14.0),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Slidable(
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.25,
              child: Container(
                height: 102.0,
                width: 315.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 15.0,),
                    Container(
                      width: 75.0,
                      height: 75.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage("assets/dish1.png"),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(1, 1),
                            spreadRadius: 2,
                            blurRadius: 2,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(55),
                      ),
                    ),
                    SizedBox(width: 30.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30.0,),
                        Text("Tomato Veggie",style: TextStyle(fontSize: 17.0),),
                        SizedBox(height: 7.0,),
                        Text("GHS 8.00",style: TextStyle(fontSize: 15.0,color: Color(0xFFFA4A0C)),),
                      ],
                    ),
                    SizedBox(width: 20.0,),
                    Container(
                      height: 25.0,
                      width: 55.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFFA4A0C),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "+",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                          Text(
                            "1",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.0),
                          ),
                          Text(
                            "-",
                            style:
                                TextStyle(color: Colors.white, fontSize: 22.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              secondaryActions: <Widget>[
                IconSlideAction(
                  color: Colors.transparent,
                  iconWidget: CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    child: Icon(
                      Icons.favorite,
                      size: 28.0,
                    ),
                    radius: 30.0,
                  ),
                  onTap: () {},
                ),
                IconSlideAction(
                  color: Colors.transparent,
                  iconWidget: CircleAvatar(
                    backgroundColor: Colors.black45,
                    child: Icon(
                      Icons.delete_outline_outlined,
                      size: 30.0,
                    ),
                    radius: 30.0,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
